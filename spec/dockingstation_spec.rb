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

  it 'Allows two bikes to be docked when docking station set up with default capacity' do
  	expect{
  	  station = DockingStation.new
  	  station.dock(Bike.new)
  	  station.dock(Bike.new)}.to_not raise_error
  end

  it "Throws error when trying to add more bikes than the capacity" do
    expect{
      station = DockingStation.new
      (station.capacity + 1).times {
        station.dock(Bike.new)
      }}.to raise_error
  end

  it "Doesn't throw an error when passed an argument of capacity" do
    expect{
      station = DockingStation.new(9001)}.to_not raise_error
  end

  it { DockingStation.new.capacity.should eq(20) } # testing default capacity is 20

  it "Allows user to update status of bike when docking" do
    expect{
      DockingStation.new.dock(Bike.new, false)}.to_not raise_error
  end

  it "Will not release any broken bikes" do
    expect{
      station = DockingStation.new
      10.times {
        bike = Bike.new
        bike.update_to_broken
        station.dock(bike)
      }
      station.release_bike
    }.to raise_error
  end

  it "Will accept both broken and working bikes" do
    expect{
      station = DockingStation.new
      bike1 = Bike.new
      bike2 = Bike.new
      bike2.update_to_broken
      station.dock(bike1)
      station.dock(bike2)
    }.to_not raise_error
  end

end
