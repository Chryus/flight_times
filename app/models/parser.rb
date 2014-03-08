require 'csv'

class Parser

	attr_accessor :output
	attr_reader :columns, :rows

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

	def format_date date
    reg = /^(\d{2})\/(\d{2})\/(\d{4})$/
    matches = date.match(reg)
    $2 << "/" << $1 + "/" << $3
  end

#["Carrier Code", "Date (MM/DD/YYYY)", "Flight Number", "Tail Number", "Origin Airport ", "Scheduled Arrival Time", "Actual Arrival Time", nil]
	def add_to_database destination_id
		parse_flights.each do |hash|
			next if hash["Actual Arrival Time"] == "00:00"
			date = hash["Date (MM/DD/YYYY)"]
			new_date = format_date date
			airline = hash["Carrier Code"]
			airport = hash["Origin Airport "]
			number = hash["Flight Number"]
			airline_object = Airline.find_by_name(airline)
			if airline_object.nil?
				airline_object = Airline.create(:name => hash["Carrier Code"])
			end
			flight_object = Flight.find_by_number(number)
			if flight_object.nil?
				flight_object = Flight.create(
					:number => hash["Flight Number"],
					:airline_id => airline_object.id	
					)
			end
			airport_object = Airport.find_by_name(airport)
			if airport_object.nil? #if the current airport in the hash isn't already in the database, make it
				airport_object = Airport.create(:name => hash["Origin Airport "])
			end
			arrival_object = Arrival.create(
				:date => new_date,
				:scheduled_time => hash["Scheduled Arrival Time"],
	  		:actual_time => hash["Actual Arrival Time"],
	  		:flight_id => flight_object.id,
	  		:airport_id => destination_id
				)
			departure_object = Departure.create(
				:date => new_date,
	  		:flight_id => flight_object.id,
	  		:airport_id => airport_object.id
				)
		end
	end

	def self.make_objects origin_id
     Parser.new('lib/united.csv').add_to_database origin_id
  end

end
