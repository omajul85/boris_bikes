require_relative './Bike'

class DockingStation
  attr_reader :bike
  
  def release_bike
    raise "No bike"
    Bike.new
  end
  
  def dock(bike)
    @bike = bike
  end

  def has_bike?
    true
  end

end
