# require 'debugger'

require 'Time'


class Airport

	attr_accessor :start, :t, :a, :arrival, :arrivals, :difference, :cache, :starter, :time_expected, :got_in, :other_flight, :started, :time_expectation, :arrived, :other_flights

	def initialize
			@start = nil 
			@t = nil
			@a = nil
			@arrival = nil
			@arrivals = []
			@difference = nil 
			@cache = []
			@starter = nil
			@time_expected = nil
			@got_in = nil
			@other_flight = nil 
			@started = nil
			@time_expectation = nil
			@arrived = nil
			@more_flights = nil 
	end

	def plane
		puts "In military hour format, what hour is the flight supposed to arrive?"
			hour = gets.chomp
		puts "What minute? If on the hour, enter in '00'"
			minute = gets.chomp
		@start = hour + ":" + minute
		# debugger
		@t=Time.parse(@start)
		@t.strftime("%I:%M%p")
	end
	
	def arrival
		puts "In military hour format, when did the plane ACTUALLY arrive?"
			arrival_hour = gets.chomp
		puts "What minute? If on the hour, enter in '00'"
			arrival_minute = gets.chomp
		@arrival = arrival_hour + ":" + arrival_minute
		# debugger
		@a=Time.parse(@arrival)
		@a.strftime("%I:%M%p")
	end

	def time_difference
		# debugger
		eta = @t
		arrival_time = @a
		@difference = arrival_time - eta
	end

	def converter
		if @difference == 0
			@cache << 0
			"the flight was right on time!"
		elsif @difference >= 1 && @difference <= 60 
			minutes = @difference/60
			@cache << minutes
			"The flight was #{minutes} minutes off schedule."
		else @difference >= 61 
			minutes = @difference/60
			hours = minutes/60
			@cache << hours
			"The flight was #{hours} hours off schedule."
		end

	end

	def accumulator
		puts "was this the only time you were expecting a flight with this airline? (y/n)"
		answer = gets.chomp.downcase
			if answer == "n"
				puts "OK, lets do this again. In military hour format, what hour was the other flight supposed to arrive?"
				hour = gets.chomp
				puts "What minute? If on the hour, enter in '00'"
				minute = gets.chomp
				@starter = hour + ":" + minute
				@time_expected=Time.parse(@starter)
				# debugger	
					puts "In military hour format, when did that plane ACTUALLY arrive?"
					arrival_hour = gets.chomp
					puts "What minute? If on the hour, enter in '00'"
					arrival_minute = gets.chomp
					@got_in = arrival_hour + ":" + arrival_minute
					# debugger
					@got_in=Time.parse(@got_in)
						eta = @time_expected
						arrival_time = @got_in
						@other_flight = arrival_time - eta			
			else answer == "y"
				"nevermind then."
			end		
	end

	def more
		if @other_flight == 0
			@cache << 0
			"Awesome, that flight was on time."
		elsif @other_flight >= 1 && @other_flight <= 60 
			minutes = @other_flight/60
			@cache << minutes
			"That flight was #{minutes} minutes off schedule."
		else @other_flight >= 61 
			minutes = @other_flight/60
			hours = minutes/60
			@cache << hours
			"That flight was #{hours} hours off schedule."
		end
	
	end

	def get_even_more
			puts "Were there other flights with this airline? (y/n)"
				    answer = gets.chomp.downcase
					while answer == "y"

						puts "OK, we can keep going. In military hour format, what hour was the other flight supposed to arrive?"
						hour = gets.chomp
							puts "What minute? If on the hour, enter in '00'"
							minute = gets.chomp
								@starter = hour + ":" + minute
								@time_expected=Time.parse(@starter)
								# debugger	
									puts "In military hour format, when did that plane ACTUALLY arrive?"
									arrival_hour = gets.chomp
										puts "What minute? If on the hour, enter in '00'"
										arrival_minute = gets.chomp
											@got_in = arrival_hour + ":" + arrival_minute
											# debugger
											@got_in=Time.parse(@got_in)
												eta = @time_expected
												arrival_time = @got_in
												@other_flight = arrival_time - eta	
													puts "Any more flights? (y/n)"
														answer = gets.chomp.downcase			
					end
						"Awesome.  Lets calculate the average times for those flights."
	end

	def final_number
			if @other_flight == 0
			@cache << 0
			# "Awesome, that flight was on time."
		elsif @other_flight >= 1 && @other_flight <= 60 
			minutes = @other_flight/60
			@cache << minutes
			# "That flight was #{minutes} minutes off schedule."
		else @other_flight >= 61 
			minutes = @other_flight/60
			hours = minutes/60
			@cache << hours
			# "That flight was #{hours} hours off schedule."
		end
	
	# end

	def average
		total_flights = @cache.count
		sum_of_times = @cache.reduce(:+) 
		magic_number = sum_of_times/total_flights
		"Based on the information you gave, this airline is off schedule by #{magic_number} hours."      
	end


	
end
end

plane = Airport.new
p plane.plane
p plane.arrival
p plane.time_difference
p plane.converter
p plane.accumulator
p plane.more
p plane.get_even_more
p plane.final_number
p plane.average








