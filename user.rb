require './scooter'
require './station'

class User
	attr_accessor :name, :scooter
	
	def initialize(name, scooter=nil)
		@name = name
		@scooter = scooter
	end
	
	def has_scooter?
		return 'No' if @scooter.nil?
		
		return 'Yes, scooter ID is #{@scooter.id}'
	end
	
	def rent(station)
		return 'You already rented a scooter!' if @scooter

		@scooter = station.release
		@scooter.status = 'Rented'
		@scooter.start_time = Time.now

	end
	
	def return(station) 
		station.receive(@scooter)

		payment = calculate_rental

		puts "#{name} pays: RM#{payment.round(2)}"

		@scooter.start_time = nil
		@scooter.status = 'Available'
		@scooter = nil

	end

	def calculate_rental
		rental_duration = (Time.now + rand(60...300)) - @scooter.start_time
		rental_cost = (rental_duration/60) * 10.00 
	end
	
end
