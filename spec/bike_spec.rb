require 'bike'

describe Bike do
	it { expect(subject).to be_instance_of(Bike) }
	it { expect(subject).to respond_to(:working?) }
	it { expect(subject).to respond_to(:update_to_broken) }
end
