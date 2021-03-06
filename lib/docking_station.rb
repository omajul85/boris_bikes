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
	
	def receive_bikes_from_van(van)
		dock(van.bikes.shift) while not full?
		@bikes.compact!
	end

	private
	
		def full?
			@bikes.size >= capacity
		end
		
		def empty?
			@bikes.empty?
		end
end