require 'debugger'

class Arrival < ActiveRecord::Base

  attr_accessible :date, :scheduled_time, :actual_time, :flight_id, :origin_airport_id, :destination_airport_id

  belongs_to :flight
  belongs_to :origin, :class_name => "Airport", :foreign_key => 'origin_airport_id'
  belongs_to :destination, :class_name => "Airport", :foreign_key => 'destination_airport_id'

  def self.get_arrival_times(flight_id, origin_airport_id)
    self.all.collect do |arrival|
      if arrival.flight_id == flight_id && arrival.origin_airport_id == origin_airport_id
        arrival.actual_time
      end
    end.compact
  end

end
