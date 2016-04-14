class Van
  
  DEFAULT_CAPACITY = 2
  
  attr_reader :broken_bikes, :working_bikes
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @broken_bikes = []
    @working_bikes = []
    @capacity = capacity
  end
  
  def collect_broken_bikes_from_station(station)
    @broken_bikes = station.select_broken_bikes(@capacity)
    @capacity -= @broken_bikes.count
    @broken_bikes
  end
  
  def send_broken_bikes_to_garage(garage)
    garage.receive_bikes_from_van(@broken_bikes)
    @broken_bikes = []
    garage.bikes
  end
  
  def collect_working_bikes_from_garage(garage)
    @working_bikes = garage.deliver_bikes_to_van(@capacity)
    @capacity -= @working_bikes.count
  end
  
end