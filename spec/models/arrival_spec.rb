require 'spec_helper'

describe Arrival do

  let!(:arrival1) { Arrival.create(:date => "2013-12-01", :scheduled_time => "12:00", :actual_time => "12:05", :flight_id => 1, :origin_airport_id =>1, :destination_airport_id => 1) }
  let!(:arrival2) { Arrival.create(:date => "2013-12-03", :scheduled_time => "12:00", :actual_time => "13:28", :flight_id => 1, :origin_airport_id =>1, :destination_airport_id => 1) }
  let!(:arrival3) { Arrival.create(:date => "2013-12-05", :scheduled_time => "12:00", :actual_time => "12:05", :flight_id => 1, :origin_airport_id =>2, :destination_airport_id => 1) }
  let!(:arrival4) { Arrival.create(:date => "2013-12-07", :scheduled_time => "12:00", :actual_time => "12:05", :flight_id => 2, :origin_airport_id =>2, :destination_airport_id => 1) }

  describe ".get_arrival_times" do 

    it 'should return an array of actual arrival times for flights with the same id and origin airport' do
      expect(Arrival.get_arrival_times(1, 1)).to eq(["12:05", "13:28"])
    end

  end

end


#<Arrival id: 1, scheduled_time: "20:00", actual_time: "20:05", flight_id: 1, created_at: "2014-03-23 19:38:33", updated_at: "2014-03-23 19:38:33", date: "2013-12-01 00:00:00", origin_airport_id: 2, destination_airport_id: 1>