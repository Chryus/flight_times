class Flight < ActiveRecord::Base
  
  attr_accessible :number, :airline_id

  belongs_to :airline
  has_many :trips
  has_many :airports, :through => :trips

  #f.trips.where(:type => "Arrival")[0].actual_time
  #f.airports
  
  def self.make_flights
     Parser.new('lib/united.csv').add_to_database
  end

  def parse_time
    reg = /(\d{2}|\d{1}):(\d{2})/
    time_parse = arrivals.collect {|time| time.scan(reg)}.flatten
    time_out_of_strings = time_parse.collect{|time| time.to_i}
  end

  def hours_to_minutes
    #need to conver this needs evens
    hours = parse_time.select.each_with_index{|num, i| i.even?}#values_at(0,2,4,6,8)
    hours.collect{|hour| hour * 60}
  end

  def add_extra_minutes
    #need to convert this to odds
    minutes = parse_time.select.each_with_index{|num, i| i.odd?}#values_at(1,3,5,7,9)
    #this is a bit of ruby magic that adds indices from both arrays via .zip
    hours_to_minutes.zip(minutes).map{|both| both.reduce(:+)}
  end

  def mean_minutes
    add_extra_minutes.reduce(:+)/arrivals.size
  end

  def mean_minutes_to_hours
    (mean_minutes.to_f/60).round(2)
  end

  def hours_remainder
    (mean_minutes_to_hours - mean_minutes_to_hours.round(0)).abs
  end

  def hours_remainder_to_minutes
    ((hours_remainder * 100)*60/100).round(0).to_f/100        #take the remainder in hours and convert to minutes, round to the whole minute, and convert to decimal
  end

  def add_minutes_to_hours
    hours_remainder_to_minutes + mean_minutes_to_hours.round(0)
  end

  def return_average_flight_time_midnight
    reg = /(\.)/
    if add_minutes_to_hours > 12
            time = add_minutes_to_hours.to_s.gsub(reg, ":")
            time<<"am"
    else
            time = add_minutes_to_hours.to_s.gsub(reg, ":")
            time<<"pm"
    end
    time
  end

  def return_average_flight_time_midday
    reg = /(\.)/
    if add_minutes_to_hours < 12
            time = add_minutes_to_hours.to_s.gsub(reg, ":")
            time<<"am"
    else
            time = add_minutes_to_hours.to_s.gsub(reg, ":")
            time<<"pm"
    end
    time
  end

  def return_average_flight_time
    reg = /(\.)/
    if arrivals[0].include?("am")
            time = add_minutes_to_hours.to_s.gsub(reg, ":")
            time<<"am"
    else
            time = add_minutes_to_hours.to_s.gsub(reg, ":")
            time<<"pm"
    end
    time
  end

  def return_flight
    average_time = nil
    if arrivals[0].include?("pm") && arrivals[-1].include?("am") 
      average_time = return_average_flight_time_midnight
    elsif arrivals[0].include?("am") && arrivals[-1].include?("pm")
      average_time = return_average_flight_time_midday
    else
      average_time = return_average_flight_time
    end
    average_time
  end

end


