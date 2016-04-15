class Garage
  
  attr_reader :bikes
  
  def initialize
    @bikes = []
  end
  
  def receive_bikes_from_van(van)
    @bikes = van.bikes
    fix_bikes
  end
  
  def deliver_working_bikes(quantity)
    working_bikes = []
    @bikes.each do |bike|
			working_bikes << bike if working_bikes.count < quantity
		end
		@bikes -= working_bikes
    working_bikes
  end
  
  private
  
    def fix_bikes
      @bikes.each { |bike| bike.report_working }
    end
end