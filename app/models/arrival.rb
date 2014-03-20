class Arrival < ActiveRecord::Base

  attr_accessible :date, :scheduled_time, :actual_time, :flight_id, :origin_airport_id, :destination_airport_id

  belongs_to :flight
  belongs_to :origin, :class_name => "Airport", :foreign_key => 'origin_airport_id'
  belongs_to :destination, :class_name => "Airport", :foreign_key => 'destination_airport_id'

end
