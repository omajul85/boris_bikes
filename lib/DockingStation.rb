require_relative './Bike'

class DockingStation
  attr_reader :bike
  
  def release_bike
    raise "No bike" unless @bike
    Bike.new
  end
  
  def dock(bike)
    raise "Station full" if @bike
    @bike = bike
  end

  def has_bike?
    true
  end

end
