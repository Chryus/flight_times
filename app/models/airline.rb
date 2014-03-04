class Airline < ActiveRecord::Base

  attr_accessible :carrier

  has_many :flights
  
end
