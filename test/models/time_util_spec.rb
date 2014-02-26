require './time_util_challenge.rb'

describe "Flight, #initialize" do 

			it 'Can initialize a subtitle' do
    		lambda {Flight.new}.should_not raise_error
  		end

  		it "has an array of arrival times" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
  			flight.arrivals.should eq(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])  
   		end
  end

describe "Flight, #parse_time" do 

  		it "should return an array consisting of only integers" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
  			flight.parse_time.should eq([11, 51, 11, 56, 12, 01, 12, 06, 12, 11])  
   		end
  end

 describe "Flight, #hours_to_minutes" do 

  		it "should return an array of hours converted to minutes" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
  			flight.hours_to_minutes.should eq([660, 660, 720, 720, 720])  
   		end
  end


  describe "Flight, #add_extra_minutes" do 

  		it "should add the remainder of minutes to the hours_to_mintues array" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
  			flight.add_extra_minutes.should eq([711, 716, 721, 726, 731])  		
  end
end

   describe "Flight, #mean_minutes" do 

  		it "should return average minutes from an array" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
  			flight.mean_minutes.should eq(721)  		
  end
end

  describe "Flight, #mean_minutes_to_hours" do 

  		it "should take average minutes and return it as hours" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
  			flight.mean_minutes_to_hours.should eq(12.02)  		
  end
end

  describe "Flight, #hours_remainder" do 

  		it "should return the remainder of hours" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]) 
  			flight.hours_remainder.should eq(0.019999999999999574)  		
  end

end

  describe "Flight, #add_minutes_to_hours" do 

  		it "should add the remainder of minutes to the hours" do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]) 
  			flight.add_minutes_to_hours.should eq(12.01)  		
  end

end

  describe "Flight, #add_minutes_to_hours" do 

  		it "should format the average flight times in meridian time." do
  			flight = Flight.new(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]) 
  			flight.add_minutes_to_hours.should eq("12:01am")  		
  end

end