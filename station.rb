class Station

	attr_accessor :place, :capacity

	def initialize (place, capacity)
		@place = place
		@capacity = capacity
		@scooters = []
	end

	def receive(scooter)
		return "Station is full" if @scooters.count >= capacity

		@scooters << scooter
	end

	def release
		return "No available scooters" if good_scooters.count.zero?
		
		scooter = good_scooters.last
		@scooters.delete(scooter)
		scooter
	end

	def good_scooters
		@scooters.reject do |scooter|
			scooter.is_broken?
		end
	end
end