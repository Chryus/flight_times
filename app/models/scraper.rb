require 'awesome_print'
require 'open-uri' #open the file on the internet
require 'nokogiri' #nokogiri magic and methods 
require 'debugger'

#refactoring notes are in separate file scraper_refactoring-notes.rb

class Scraper
attr_reader :html

	def initialize(url)
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	def get_flight_arrivals
		stuff = html.search("table, #pastflights").collect { |stuff| stuff.text }
		inspect(stuff)
	end

	def get_flight_arrivals
		html.search("//div[@id = 'pastFlights']/table").map {|row| row.text}
	end

	def inspect(stuff)
		stuff.each do |element|
			element.inspect
		end
	end

end

my_scraper = Scraper.new("http://flightwise.com/track/UAL646")
ap my_scraper.get_flight_arrivals
#puts my_scraper.get_names
#ap my_scraper.get_twitters
#ap my_scraper.get_blogs