require 'spec_helper'

describe Airline do
  let(:user) { Airline.new(:name => 'Jet Blue') }
  
  it "is valid with a name" do
    user.should be_valid
  end

  it "is not valid without a name" do
    user.name = nil
    user.should_not be_valid
  end

end
