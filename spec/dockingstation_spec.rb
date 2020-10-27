require 'dockingstation'
require 'bike'

describe 'DockingStation' do
  it { DockingStation.should respond_to(:new) }
  it { DockingStation.new.should respond_to(:release_bike) }
  it 'Releases a bike and then applies .working? method to released bike' do
  	station = DockingStation.new
  	station.dock(Bike.new) # had to include this line and one above after feature was added to throw error when calling .release_bike if bike_array is empty
  	bike = station.release_bike
  	expect(bike.working?).to eq true
  end
  it { DockingStation.new.should respond_to(:dock) }
  it 'Throws an error when trying to release bike from empty docking station' do
  	expect{DockingStation.new.release_bike}.to raise_error
  end
  it 'Throws an error when trying to add bike to docking station with bike already docked' do
  	expect{
  	  station = DockingStation.new
  	  station.dock(Bike.new)
  	  station.dock(Bike.new)}.to raise_error
  end
end
