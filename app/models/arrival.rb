class Arrival < ActiveRecord::Base

  attr_accessible :date, :scheduled_time, :actual_time, :flight_id, :origin_airport_id, :destination_airport_id

  belongs_to :flight
  belongs_to :origin, :class_name => "Airport", :foreign_key => 'origin_airport_id'
  belongs_to :destination, :class_name => "Airport", :foreign_key => 'destination_airport_id'

  # def self.get_flight_times number, origin #searches for a flight by number and returns an array of arrival times for that flight
  #   flight = Flight.find_by_number number
  #   airport = Airport.find_by_name origin
  #   departure = flight.trips.where(:type => "Departure").first
  #   arrivals = flight.trips.where(:type => "Arrival")
  #     departures = flight.trips.where(:type => "Departure")
  #     departure_id = departures.first.airport_id

  #   my_arrivals = []
  #   arrivals.each do |arrival|
  #     departures.each do |depature|


  #   , :airport_id => airport.id).collect { |arrival| arrival.actual_time }
  # end

  
end
