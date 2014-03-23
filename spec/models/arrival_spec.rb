require 'spec_helper'

describe Arrival do

  let (:arrival1) { FactoryGirl.create(:arrival, :date => "01/12/13", :scheduled_time => "12:00", :actual_time => "12:05", :flight_id => 1, :origin_airport_id =>1, :destination_airport_id => 1) }
  let (:arrival2) { FactoryGirl.create(:arrival, :date => "01/13/13", :scheduled_time => "12:00", :actual_time => "13:28", :flight_id => 1, :origin_airport_id =>1, :destination_airport_id => 1) }
  let (:arrival3) { FactoryGirl.create(:arrival, :date => "01/15/13", :scheduled_time => "12:00", :actual_time => "12:05", :flight_id => 1, :origin_airport_id =>2, :destination_airport_id => 1) }
  let (:arrival3) { FactoryGirl.create(:arrival, :date => "01/15/13", :scheduled_time => "12:00", :actual_time => "12:05", :flight_id => 2, :origin_airport_id =>2, :destination_airport_id => 1) }

    attr_accessible :date, :scheduled_time, :actual_time, :flight_id, :origin_airport_id, :destination_airport_id


  describe ".get_arrival_times" do 

    it 'should return an array' do
      expect([arrival1, arrival2].get_flight_times).to_be Array
    end

    it 'should return an array of actual arrival times for flights with the same id and origin airport' do
      expect([arrival1, arrival2].get_flight_times).to eq(["12:05", "13:28"])
    end

  end

end
