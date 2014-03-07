class Airport < ActiveRecord::Base
  
  attr_accessible :name, :arrivals, :departures, :flights

  has_many :trips
  has_many :flights, :through => :trips


  def self.make_destination airport
    Airport.create(:name => airport)
  end

end
