require 'pry'
require_relative './Bike'

class DockingStation

DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end
  
  def release_bike
    raise "No bike" if empty?
    @bikes.pop
  end
  
  def dock(bike)
    raise "Station full" if full?
    @bikes << bike
    @bikes.last
  end

  def has_bike?
    true
  end

  private

    def full?
      @bikes.length >= DEFAULT_CAPACITY
    end

    def empty?
      @bikes.empty?
    end

end


