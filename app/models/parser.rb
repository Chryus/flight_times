require 'csv'

class Parser < ActiveRecord::Base

	attr_accessor :output
	attr_reader :columns, :rows

#["Carrier Code", "Date (MM/DD/YYYY)", "Flight Number", "Tail Number", "Origin Airport ", "Scheduled Arrival Time", "Actual Arrival Time", nil]
	def initialize(path_to_csv)
		flights_csv = CSV.read(path_to_csv)
		@columns = flights_csv.first
		@rows = flights_csv[1..-1]
		@output = []
  end

#["UA", "12/31/2013", "1675", "N39461", "TPA", "13:07", "12:59", nil], ["UA", "12/31/2013", "1686", "N24729", "SJU", "19:20", "19:37", nil]
	def parse_flights
		rows.each do |row|
			hash = {}
			row.each_with_index do |attribute, i|
				if i < row.length-1 
					hash[columns[i]] = attribute
				end		
			end
			output << hash
		end 
		output
	end

#["Carrier Code", "Date (MM/DD/YYYY)", "Flight Number", "Tail Number", "Origin Airport ", "Scheduled Arrival Time", "Actual Arrival Time", nil]
	def add_to_database(destination_id)
		parse_flights.each do |hash|
			hash.each do |attribute, value|
			airline_object = Airline.create(:name => hash["Carrier Code"])
			flight_object = Flight.create(
				:number => hash["Flight Number"]
				:airline_id => airport_object.id	
				)
			airport_object => Airport.create(:name => hash["Origin Airport"])
			arrival_object = Arrival.create(
				:date => hash["Date (MM/DD/YYYY)"]
				:scheduled_time => hash["Scheduled Arrival Time"]
    		:actual_time => hash["Actual Arrival Time"]
    		:flight_id => flight_object.id
    		:airport_id => airport_object.id
				)
			departure_object = Departure.create(
				:date => hash["Date (MM/DD/YYYY)"]
    		:flight_id => flight_object.id
    		:airport_id => destination_id
				)
			airport_object
			end
		end
	end


# {"Carrier Code"=>"UA", 
#     "Date (MM/DD/YYYY)"=>"12/31/2013",
#     Flights 
#     "Flight Number"=>"1686", 
#    # "Tail Number"=>"N24729", 
#    Airports
#     "Origin Airport "=>"SJU", 
#     Arrivals
#     "Scheduled Arrival Time"=>"19:20", 
#     "Actual Arrival Time"=>"19:37"
# }


end

# p = Parser.new('united.csv')
# p.flights_csv
# parser.flights_csv.first
