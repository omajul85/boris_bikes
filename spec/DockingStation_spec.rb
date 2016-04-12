require 'DockingStation'

describe DockingStation do
  it { is_expected.to respond_to(:dock) }
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to have_attributes(:bikes => [] ) }
  
  it "responds to dock with 1 argument" do
      expect(subject).to respond_to(:dock).with(1).argument 
  end
  
  context "#release_bike" do
    it "raises an exception if there's no bike" do
      expect { subject.release_bike }.to raise_error "No bike"
    end
  end
  
  context "#dock" do
    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock Bike.new }.to raise_error 'Station full'
    end
  end

  context "Mixing docking and releasing actions" do
    it "docks and releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end
  end
end
