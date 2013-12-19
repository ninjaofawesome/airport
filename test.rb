# require 'debugger'

require 'Time'


class Airport

	def initialize
		@storage = [ ]
	end



	def get_times
		puts "What time was the flight supposed to arrive? (hh:mm)(AM/PM)"
			@first_flight = gets.chomp
		puts "What time did the flight actually land? (hh:mm)(AM/PM)"
		 	@first_arrival = gets.chomp
		puts "Have you expected other flights from this airline previously?"
	 		@answer = gets.chomp.downcase
	 	puts "Any more flights? (y/n)"
			@more_flights = gets.chomp.downcase
	end

	def time_conversion
		time_1 = @first_flight.split(/(.*)\:(.*)(AM|PM|am|pm)/)
		time_1.inspect
		hours = time_1[1].to_i
		minutes = time_1[2].to_i
			if time_1[3] == "pm" && hours <=11 
					military_time = hours + 12	
			end
		new_time = "#{military_time}" + ":" + "#{minutes}"
		@arrival = Time.parse(new_time)	
	end

	# def arrival
	# 	puts "What time did the flight actually land? (hh:mm)(AM/PM)"
	# 	clock = gets.chomp

	# 	time_1 = clock.split(/(.*)\:(.*)(AM|PM|am|pm)/)
	# 	time_1.inspect
	# 	hours = time_1[1].to_i
	# 	minutes = time_1[2].to_i
	# 		if time_1[3] == "pm" && hours <=11 
	# 				military_time = hours + 12	
	# 		end
	# 	new_time = "#{military_time}" + ":" + "#{minutes}"
	# 	touchdown = Time.parse(new_time)
	# 	@storage << ((touchdown - @arrival)/60)/60
	# end

	# def more_flights
	# 	puts "Have you expected other flights from this airline previously?"
	# 	answer = gets.chomp.downcase

	# 	while answer == "y"
	# 		puts "What time was the flight supposed to arrive? (hh:mm)(AM/PM)"
	# 		clock = gets.chomp
	# 		time_1 = clock.split(/(.*)\:(.*)(AM|PM|am|pm)/)
	# 		time_1.inspect
	# 		hours = time_1[1].to_i
	# 		minutes = time_1[2].to_i
	# 			if time_1[3] == "pm" && hours <=11 
	# 					military_time = hours + 12	
	# 			end
	# 		new_time = "#{military_time}" + ":" + "#{minutes}"
	# 		@arrival = Time.parse(new_time)	

	# 		puts "What time did the flight actually land? (hh:mm)(AM/PM)"
	# 		clock = gets.chomp

	# 		time_1 = clock.split(/(.*)\:(.*)(AM|PM|am|pm)/)
	# 		time_1.inspect
	# 		hours = time_1[1].to_i
	# 		minutes = time_1[2].to_i
	# 			if time_1[3] == "pm" && hours <=11 
	# 					military_time = hours + 12	
	# 			end
	# 		new_time = "#{military_time}" + ":" + "#{minutes}"
	# 		touchdown = Time.parse(new_time)
	# 		@storage << ((touchdown - @arrival)/60)/60

	# 		puts "Any more flights? (y/n)"
	# 		answer = gets.chomp.downcase		
	# 	end	

	# end

	

	# def average
	# 	count = @storage.count
	# 	sum = @storage.inject(:+)
	# 	answer = sum/count
	# 	"Based on your responses, out of the #{count} flights you entered your airline is #{answer} minutes off schedule."

	# end

		
	
	

end#<--end of class!
	
		
	

test = Airport.new
test.time_conversion
p test.eta
# p test.arrival
# p test.more_flights
# p test.average