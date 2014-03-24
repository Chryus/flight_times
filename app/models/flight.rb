require 'debugger'

class Flight < ActiveRecord::Base
  
  attr_accessible :number, :airline_id

  belongs_to :airline
  has_many :arrivals
  has_many :airports, :through => :arrivals
      
end


