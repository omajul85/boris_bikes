require 'garage'

describe Garage do 
  it { is_expected.to respond_to(:receive_bikes_from_van).with(1).argument }
  it { is_expected.to respond_to(:deliver_working_bikes).with(1).argument }
end