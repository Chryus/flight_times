class Airline < ActiveRecord::Base

  attr_accessible :name, :flights
  has_many :flights
  validates :name, presence: true
      
end
