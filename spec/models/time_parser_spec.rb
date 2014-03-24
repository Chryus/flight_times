require 'spec_helper'

describe 'TimeParser' do

  describe "#initialize" do 

    subject { TimeParser.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]) }
    
    it 'should create a new world subject' do
      subject.is_a?(TimeParser).should be_true
    end

    it "has an array of arrival times" do
      subject.arrival_times_array.should eq(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])  
    end
  
  end

  # describe "#parse_time" do 
  #   let(:time_parser) { FactoryGirl.create :time_parser }
  #   it 'should convert data to minutes' do
  #     expect(time_parser.parse_time)
  # end
end




#Convert the data to minutes, avg the total minutes and then back to a time.
