require 'spec_helper'

describe TimeParser do

  describe "#initialize" do 

  it 'can initialize a TimeParser' do
    let(:time_parser) { FactoryGirl.create :time_parser(1, 1) }.should_not raise_error
  end

  it "has an array of arrival times" do
    let(:time_parser) { FactoryGirl.create :time_parser(1, 1) }
    time_parser.times.should eq(["12:01", "12:11", "12:21", "12:31", "12:41", "12:51"])  
  end
  
end

end



#Convert the data to minutes, avg the total minutes and then back to a time.
