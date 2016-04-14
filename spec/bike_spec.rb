require 'bike'

describe Bike do

	it { is_expected.to respond_to :broken? }  	
	it { is_expected.to respond_to :report_broken }
	it { is_expected.to respond_to :report_working }

	it "reports a broken bike" do
		expect(subject.report_broken).to be true
	end
	
	it "reports a working bike" do
		expect(subject.report_working).to be false
	end
end