class Garage
  
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end
  
  def receive_bikes_from_van(van)
    @bikes = van.broken_bikes
  end
  
  def deliver_bikes_to_van(van)
    van.collect_working_bikes_from_garage
  end
  
  def fix_bikes
    @bikes.each { |bike| bike.report_working }
  end
end