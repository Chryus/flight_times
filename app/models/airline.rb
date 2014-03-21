class Airline < ActiveRecord::Base

  attr_accessible :name, :flights
  has_many :flights
  has_many :trips, :through => :flights
  validates :name, presence: true
      
end
