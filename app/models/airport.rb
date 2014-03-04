class Airport < ActiveRecord::Base
  
  attr_accessible :name

  has_many :flights
  
end
