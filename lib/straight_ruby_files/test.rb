require 'debugger'

require 'Time'

class Airport

	attr_reader :flight_info

	def initialize
		@flight_info = []
	end

	def first_flight
		puts "What time was the flight supposed to arrive? (hh:mm)(AM/PM)"
			first_flight_eta = gets.chomp.downcase
			@eta = Time.parse(first_flight_eta)
		puts "When did that flight actually arrive? (hh:mm)(AM/PM)"
			first_flight_arrival = gets.chomp.downcase
			@arrival = Time.parse(first_flight_arrival)
	end

	def first_flight_info
		difference = ((@arrival- @eta)/60)/60
		flight_info << difference
	end

	def gather_more_flights
		puts "Were there other flights you were expecting with this airline previously? (y/n)"
			answer = gets.chomp.downcase

		while answer == "y"

			puts "OK, lets do this again. When was that flight supposed to arrive? (hh:mm)(AM/PM)"
				other_flight_eta = gets.chomp.downcase
				converted_time = Time.parse(other_flight_eta)

			puts "And when did that plane ACTUALLY arrive? (hh:mm)(AM/PM)"
				other_flight_arrival = gets.chomp
				converted_time_arrival = Time.parse(other_flight_arrival)

				more_flight_difference = ((converted_time_arrival - converted_time)/60)/60
				flight_info << more_flight_difference

			puts "Any more flights? (y/n)"
			answer = gets.chomp.downcase	

		end	

		"OK cool.  Let's crunch the numbers"
	end

	def conversion
		flight_count = flight_info.count
		sum_of_flight_times = flight_info.inject(:+)
		answer = sum_of_flight_times/flight_count
		"based on the last #{flight_count} flights, this airline is #{answer} hours off schedule.  Plan accordingly."
	end
	
end#<--end of class!

test = Airport.new
p test.first_flight
p test.first_flight_info
p test.gather_more_flights
p test.conversion

