require_relative './bike'
require_relative './van'
require_relative './garage'

class DockingStation
	DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		raise "no bikes" if empty?
		raise "no working bikes available" if @bikes.last.broken?
		@bikes.pop unless @bikes.last.broken?
	end

	def dock(bike)
		raise "Over-Capacity" if full?
		@bikes << bike
		@bikes.last
	end
	
	def select_broken_bikes(quantity)
		broken_bikes = []
		@bikes.each do |bike|
			broken_bikes << bike if bike.broken? and broken_bikes.count < quantity
		end
		@bikes -= broken_bikes
		broken_bikes
	end
	
	private
	
		def full?
			@bikes.size >= capacity
		end
		
		def empty?
			@bikes.empty?
		end
end

# b1 = Bike.new
# b2 = Bike.new                                                                                                              
# b3 = Bike.new
# b1.report_broken
# b2.report_broken
# ds = DockingStation.new
# ds.dock b1
# ds.dock b2
# ds.dock b3
# ds.select_broken_bikes