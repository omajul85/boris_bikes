require 'van'

describe Van do
  let(:broken_bike) { double(:bike, report_broken: true, broken?: true) }
	let(:broken_bike2) { double(:bike, report_broken: true, broken?: true) }
	let(:bike3) { double(:bike, report_broken: false, broken?: false) }
	let(:bike4) { double(:bike, report_broken: false, broken?: false) }
  let(:station) { double(:station, :bikes => [broken_bike, broken_bike2]) }
  let(:garage) { double(:garage) }
  it { is_expected.to respond_to :collect_broken_bikes_from_station } 
  
  it "collects broken bikes" do
    allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
    expect(subject.collect_broken_bikes_from_station(station)).to eq [broken_bike, broken_bike2]
  end
  
  it "sends broken bikes to garage" do
    allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
    allow(garage).to receive(:receive_bikes_from_van).and_return([broken_bike, broken_bike2])
    allow(garage).to receive(:bikes).and_return([broken_bike, broken_bike2])
    broken_bikes = subject.collect_broken_bikes_from_station(station)
    expect(subject.send_broken_bikes_to_garage(garage)).to eq broken_bikes
    expect(subject.bikes).to be_empty
  end
  
  it "picks up working bikes from garage" do
    allow(garage).to receive(:deliver_working_bikes).and_return([bike3,bike4])
    working_bikes = subject.collect_working_bikes_from_garage(garage)
    expect(subject.bikes).to eq working_bikes
  end
end