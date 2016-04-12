require 'DockingStation'

describe DockingStation do
    it { is_expected.to respond_to(:dock) }
    it { is_expected.to respond_to(:release_bike) }
    
    it "responds to dock with 1 argument" do
        expect(subject).to respond_to(:dock).with(1).argument 
    end
    
    it "returns a bike when calling dock" do
        bike = Bike.new
        expect(subject.dock(bike)).to eq(bike) 
    end

end
