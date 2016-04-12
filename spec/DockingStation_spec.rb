require 'DockingStation'

describe DockingStation do
  it { is_expected.to respond_to(:dock) }
  it { is_expected.to respond_to(:release_bike) }
  
  it "responds to dock with 1 argument" do
      expect(subject).to respond_to(:dock).with(1).argument 
  end

  context '#dock' do
    it "returns a bike when calling dock" do
        bike = Bike.new
        expect(subject.dock(bike)).to eq(bike) 
    end
  end

  it { is_expected.to have_bike } #.has_bike?

  context "#release_bike" do
    it "raises an exception if there's no bike" do
      expect { subject.release_bike }.to raise_error "No bike"
    end
  end
  
  it 'raises an error when full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect { subject.dock Bike.new }.to raise_error 'Station full'
  end

  it { is_expected.to have_attributes(:bikes => [] ) }
end
