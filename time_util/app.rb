require './parser'
require './lib/flight'
require 'awesome_print'
require 'debugger'

parser = Parser.new
parser.make_flight_objects

class FlightChecker

	attr_accessor :user_choice

	def initialize(user_choice=nil)
		@user_choice
	end

	def print_flights
		Flight.all.each do |flight|
			puts "\nFlight #{flight.number} | Arrival times: #{flight.arrivals}\n"
		end
	end

	def wanna_see_flights?
		puts "\nHello, would you like to see a list of flights? (y/n) "
		user_choice = gets.chomp.downcase
			if user_choice == "y"
			print_flights
		else
			print "Good luck with your flight."
		end
	end

	def which_flight?
		#debugger
		puts "\nPlease select a flight from the list (type in the flight number)"
		user_choice = gets.chomp.to_i
			#if user_choice.class == Fixnum
		find_flight(user_choice)
			# else
			# 	puts "I do not understand"
			# end
	end

	def find_flight(user_choice)
		Flight.all.each do |flight| 
			if flight.number == user_choice
				ap "Flight #{flight.number} has an average arrival time of #{flight.return_flight}"
			else
			 	"I'm sorry that isn't a flight."
			end
		end
	end

	def app
		while loop
			wanna_see_flights?
			which_flight?
			puts "Would you like to check another flight? (y/n)."
			if gets.chomp.downcase == "n"	
				break
			else
				print_flights
				which_flight?
			end
		end
	end

end

 calc = FlightChecker.new
 calc.app




