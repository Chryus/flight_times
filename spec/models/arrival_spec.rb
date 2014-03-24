require 'spec_helper'

describe Arrival do

  let!(:arrival1) { FactoryGirl.create(:arrival, :date => "2013-12-01", :scheduled_time => "12:00", :actual_time => "12:01", :flight_id => 1, :origin_airport_id =>1, :destination_airport_id => 1) }
  let!(:arrival2) { FactoryGirl.create(:arrival, :date => "2013-12-02", :scheduled_time => "12:00", :actual_time => "12:02", :flight_id => 1, :origin_airport_id =>1, :destination_airport_id => 1) }
  let!(:arrival3) { FactoryGirl.create(:arrival, :date => "2013-12-03", :scheduled_time => "12:00", :actual_time => "12:03", :flight_id => 1, :origin_airport_id =>1, :destination_airport_id => 1) }
  let!(:arrival4) { FactoryGirl.create(:arrival, :date => "2013-12-04", :scheduled_time => "12:00", :actual_time => "12:04", :flight_id => 2, :origin_airport_id =>2, :destination_airport_id => 1) }
  let!(:arrival5) { FactoryGirl.create(:arrival, :date => "2013-12-05", :scheduled_time => "12:00", :actual_time => "12:05", :flight_id => 2, :origin_airport_id =>2, :destination_airport_id => 1) }
  let!(:arrival6) { FactoryGirl.create(:arrival, :date => "2013-12-06", :scheduled_time => "12:00", :actual_time => "12:06", :flight_id => 2, :origin_airport_id =>2, :destination_airport_id => 1) }

  describe ".get_arrival_times" do 

    it 'should return an array of arrival times for flights with the same id and origin airport' do
      expect(Arrival.get_arrival_times(1, 1)).to eq(["12:01", "12:02", "12:03"])
    end

    it 'should return an array of arrival times for flights with the same id and origin airport' do
      expect(Arrival.get_arrival_times(2, 2)).to eq(["12:04", "12:05", "12:06"])
    end

    it 'should not include arrival times with different origin_airports' do
      expect(Arrival.get_arrival_times(1, 1)).should_not include("12:04")
    end

    it 'should not include arrival times with different flight_ids' do
      expect(Arrival.get_arrival_times(2, 2)).should_not include("12:01")
    end
  end

end


#<Arrival id: 1, scheduled_time: "20:00", actual_time: "20:05", flight_id: 1, created_at: "2014-03-23 19:38:33", updated_at: "2014-03-23 19:38:33", date: "2013-12-01 00:00:00", origin_airport_id: 2, destination_airport_id: 1>