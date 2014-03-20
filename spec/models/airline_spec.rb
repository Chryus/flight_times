require 'spec_helper'

describe Airline do
  
  airline = FactoryGirl.create(:airline, :name => "Jet Blue")

  it "is valid with a name" do
    airline.should be_valid
  end

  it "is not valid without a name" do
    airline.name = nil
    airline.should_not be_valid
  end

end

