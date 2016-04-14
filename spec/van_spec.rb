require 'van'

describe Van do
  let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true) }
	let(:broken_bike2) { double(:broken_bike2, report_broken: true, broken?: true) }
	let(:bike3) { double(:bike3, report_broken: false, broken?: false) }
  let(:station) { double(:station, :bikes => [broken_bike, broken_bike2]) }
  it { is_expected.to respond_to :collect_broken_bikes_from_station } 
  
  it "collects broken bikes" do
    allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
    expect(subject.collect_broken_bikes_from_station(station)).to eq [broken_bike, broken_bike2]
  end
  
  # it "sends broken bikes to garage" do
  #   allow(station).to receive(:select_broken_bikes).and_return([broken_bike, broken_bike2])
  #   broken_bikes = subject.collect_broken_bikes_from_station(station)
  #   expect(subject.send_broken_bikes_to_garage(garage)).to eq broken_bikes
  #   expect(subject.broken_bikes).to be_empty
  # end
end