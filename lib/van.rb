class Van
  
  DEFAULT_CAPACITY = 2
  
  attr_accessor :bikes
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  
  def collect_broken_bikes_from_station(station)
    @bikes = station.select_broken_bikes(remaining_capacity)
  end
  
  def send_broken_bikes_to_garage(garage)
    garage.receive_bikes_from_van(self)
    @bikes = []
    garage.bikes
  end
  
  def collect_working_bikes_from_garage(garage)
    @bikes = garage.deliver_working_bikes(remaining_capacity)
  end
  
  private
  
    def remaining_capacity
      @capacity - @bikes.count
    end
end