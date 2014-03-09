class Airport < ActiveRecord::Base
  
  attr_accessible :name, :arrivals, :departures, :flights

  has_many :trips
  has_many :flights, :through => :trips

  def self.make_destination destination
    airport_object = Airport.find_by_name(destination)
    if airport_object.nil? #if the current airport in the hash isn't already in the database, make it
        airport_object = Airport.create(:name => destination)
    end
  end

end
