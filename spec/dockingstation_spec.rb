require 'dockingstation'

describe 'DockingStation' do
  it { DockingStation.should respond_to(:new) }
  it { DockingStation.new.should respond_to(:release_bike) }
  it 'Releases a bike and then applies .working? method to released bike' do
  	bike = DockingStation.new.release_bike
  	expect(bike.working?).to eq true
  end
end
