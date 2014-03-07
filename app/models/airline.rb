class Airline < ActiveRecord::Base

  attr_accessible :name

  has_many :flights
  has_many :trips, :through => :flights
      
end
