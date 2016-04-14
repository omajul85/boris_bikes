class Van
  
  DEFAULT_CAPACITY = 2
  
  attr_reader :broken_bikes
  
  def collect_broken_bikes(station)
    @broken_bikes = station.select_broken_bikes
  end
  
end