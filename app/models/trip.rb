class Trip < ActiveRecord::Base

  attr_accessible :date, :scheduled_time, :actual_time, :flight_id, :origin_id, :desination_id

  belongs_to :flight
  belongs_to :origin, :class_name => "Airport", :foreign_key => 'origin_id'
  belongs_to :desination, :class_name => "Airport", :foreign_key => 'destination_id'

end
