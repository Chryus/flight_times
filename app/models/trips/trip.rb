class Trip < ActiveRecord::Base

  attr_accessible :date, :scheduled_time, :actual_time, :flight_id, :airport_id

  belongs_to :flight
  belongs_to :airport

end
