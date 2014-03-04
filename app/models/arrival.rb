class Arrival < ActiveRecord::Base
  
  attr_accessible :date, :scheduled_time, :actual_time, :flight_id

  belongs_to :flight
  
end
