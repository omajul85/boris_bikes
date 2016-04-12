require 'Bike'

describe Bike do 
  it { is_expected.to respond_to(:working?) }

  it 'responds to working?' do
    expect(subject).to be_working
  end

end