require_relative './Bike'

class DockingStation
  attr_reader :bike
  
  def release_bike
      @bike = Bike.new
  end
  
  def dock(bike)
    bike
  end

end
