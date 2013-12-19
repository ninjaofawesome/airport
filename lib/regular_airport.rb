# require 'debugger'

require 'Time'


class Airport

	attr_reader :cache

	def initialize
			@cache = []
	end
	####Account for midnight

	def collect_hours
			puts "What time was the flight supposed to arrive? (hh:mm)"
		clock = gets.split(/\:/)
		hours = clock[0].to_i
		minutes = clock[1].to_i
		puts "AM or PM?"
		time = gets.chomp.downcase
		if time == "pm"
			if hours >= 1 && hours <= 11
				conversion = hours + 12
				military_time = "#{conversion}:#{minutes}"
			else hours == 12
				conversion = (hours)
				military_time = "#{conversion}:#{minutes}"
			end
		end
		eta = Time.parse(military_time)
	end

	end

	def converter
		total = []
		@cache.each do |number|
			if number == 0
				total << 0
			elsif number >= 1 && number <= 60 
				minutes = number/60
				total << minutes
			else number >= 61 
				minutes = number/60
				hours = minutes/60
				total << hours
			end
		end
		total_flights = total.count
		sum_of_times = total.inject(:+) 
		magic_number = sum_of_times/total_flights
		"Based on the information you gave, this airline is off schedule by #{magic_number} hours.  Plan your trip accordingly."      
	end

end #<-- end of class!

plane = Airport.new
plane.flight_info
p plane.converter


