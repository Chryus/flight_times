Wrequire 'ap'

class Flight

    attr_accessor :arrivals
    ALL = []

    def initialize(arrivals=[])
      @arrivals = arrivals
      ALL << self
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
            ((hours_remainder * 100)*60/100).round(0).to_f/100 #take the remainder in hours and convert to minutes, round to the whole minute, and convert to decimal
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
    #sprintf "%.2f""%.2f" % 
end

# p a = ["8:30pm", "9:30pm", "11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]
# flight = Flight.new(["8:30pm", "9:30pm", "11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
# p flight.parse_time
# p flight.hours_to_minutes
# p flight.add_extra_minutes
# p flight.mean_minutes
# p flight.mean_minutes_to_hours
# p flight.hours_remainder
# p flight.hours_remainder_to_minutes
# p flight.add_minutes_to_hours
# p flight.add_minutes_to_hours.to_s
# p flight.return_flight


# ["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]
# ["8:30pm", "9:30pm", "11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]
# ["8:30am", "9:30am", "11:51am", "11:56am", "12:01pm", "12:06pm", "12:11pm"]
# ["1:30pm", "1:35pm", "2:51pm", "1:56pm", "2:01pm", "3:06pm", "2:00pm"]

        #lol this does the same thing as the absolute value method (.abs)
        # def hours_remainder
        #         if mean_minutes_to_hours.round(0) < mean_minutes_to_hours
        #                 mean_minutes_to_hours - mean_minutes_to_hours.round(0)
        #         else
        #                 mean_minutes_to_hours.round(0) - mean_minutes_to_hours
        #         end
        # end
