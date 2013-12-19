# require 'debugger'

require 'Time'
require './military_airport'

class Convert

	def converter
		@cache
		# @cache.each do |number|
	# 		if number == 0
	# 			total << 0
	# 		elsif number >= 1 && number <= 60 
	# 			minutes = number/60
	# 			total << minutes
	# 		else number >= 61 
	# 			minutes = number/60
	# 			hours = minutes/60
	# 			total << hours
	# 		end
	# 	end
	# 	total
	 end


	# def average
	# 	total_flights = total.count
	# 	sum_of_times = total.reduce(:+) 
	# 	magic_number = sum_of_times/total_flights
	# 	"Based on the information you gave, this airline is off schedule by #{magic_number} hours.  Plan your trip accordingly."      
	# end
	

end #<-- end of class!

flight = Convert.new
p flight.converter
# p flight.average
















