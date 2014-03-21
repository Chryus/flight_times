require 'spec_helper'

describe Airline do

  let (:airline) { FactoryGirl.create(:airline, :name => "Jet Blue") }
  let (:flight1) { FactoryGirl.create(:flight, :number => 101, :airline_id => 1) }
  let (:flight2) { FactoryGirl.create(:flight, :number => 102, :airline_id => 1) }
  
  describe "#name" do
    it "should have a name" do
      airline.name.should == "Jet Blue"
    end
  end

  describe "#flights" do
    it 'include flights' do
      airline.flights << flight1
      airline.flights << flight2
      airline.flights.should (include flight1)
      airline.flights.should (include flight2)
      airline.should have(2).flights
    end
  end

  context "valid attributes" do 
    
    it "is valid with a name" do
      airline.should be_valid
    end

    it "is not valid without a name" do
      airline.name = nil
      airline.should_not be_valid
    end

  end 

end

