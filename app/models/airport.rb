class Airport < ActiveRecord::Base
  
  attr_accessible :name, :arrivals, :departures, :flights

  has_many :trips
  has_many :flights, :through => :trips

end
