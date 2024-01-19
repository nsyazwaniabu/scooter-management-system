class Scooter
	attr_accessor :id, :condition, :status, :start_time
	
	def initialize
		@id = rand(1000...9999)
		@condition = 'Good'
		@status = 'Available'
		@start_time = nil
	end
	
	def is_available?
		@status = 'Available'
	end
	
	def is_good?
		@condition == 'Good'
	end

	def broke!
		@condition = 'Broken'
	end

	def is_broken?
		@condition == 'Broken' 
	end

	def repair!
		@condition = 'Good'
	end
	
end
