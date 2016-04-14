class Bike
	
	def broken?
		@broken
	end
	
	def report_broken
		@broken = true
	end
	
	def report_working
		@broken = false
	end

end
