require 'bike'

describe 'Bike' do
	it { Bike.should respond_to(:new) }
	it { Bike.new.should respond_to(:working?) }
end