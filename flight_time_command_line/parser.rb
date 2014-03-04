require './lib/flight.rb'
require 'awesome_print'
require 'debugger'

class Parser 

	def grab_flight_array
		flight_array = [["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"],
		["8:30pm", "9:30pm", "11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"],
		["8:30am", "9:30am", "11:51am", "11:56am", "12:01pm", "12:06pm", "12:11pm"],
		["1:30pm", "1:35pm", "2:51pm", "1:56pm", "2:01pm", "3:06pm", "2:00pm"],
		["4:20pm", "5:35pm", "1:51pm", "6:56pm", "6:01pm", "8:06pm"]]
	end

	def make_flight_objects
		grab_flight_array.each do |arrival_times|
			Flight.new(arrival_times)
		end
	end 	

end