require 'dockingstation'
require 'bike'

describe DockingStation do
  let(:bike) { double :bike }

  it { expect(subject).to be_instance_of(DockingStation) }

  it { expect(subject).to respond_to(:release_bike) }

  it 'Releases a bike and then applies .working? method to released bike' do
    allow(bike).to receive(:working?).and_return(true)
  	station = DockingStation.new
  	station.dock(bike) # had to include this line and two above after feature was added to throw error when calling .release_bike if bike_array is empty
  	released_bike = station.release_bike
  	expect(released_bike.working?).to eq true
  end


  it { expect(subject).to respond_to(:dock) }

  it 'Throws an error when trying to release bike from empty docking station' do
  	expect{ subject.release_bike }.to raise_error(StandardError)
  end

  it 'Allows two bikes to be docked when docking station set up with default capacity' do
    expect{
  	  subject.dock(bike)
  	  subject.dock(bike)}.to change { subject.bike_array.length }.by(2)
  end

  it "Throws error when trying to add more bikes than the capacity" do
    expect{
      station = DockingStation.new
      (station.capacity + 1).times {
        station.dock(bike)
      }}.to raise_error(StandardError)
  end

  it "Doesn't throw an error when passed an argument of capacity" do
    station = DockingStation.new(9001)
    expect(station.capacity).to eq(9001)
  end

  it { expect(subject.capacity).to eq(20) } # testing default capacity is 20

  it "Allows user to update status of bike when docking" do
    allow(bike).to receive(:update_to_broken)
    expect{
      subject.dock(bike, false)}.to change { subject.bike_array.length }.by(1)
  end

  it "Will not release any broken bikes" do
    expect{
      allow(bike).to receive(:working?).and_return(false)
      station = DockingStation.new
      10.times {
        station.dock(bike)
      }
      station.release_bike
    }.to raise_error(StandardError)
  end

  # it "Will accept both broken and working bikes" do
  #   expect{
  #     station = DockingStation.new
  #     bike1 = bike
  #     bike2 = bike
  #     bike2.update_to_broken
  #     station.dock(bike1)
  #     station.dock(bike2)
  #   }.to_not raise_error(StandardError)
  # end

  it "Will allow a broken bike to be docked" do
    expect{
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)}.to change { subject.bike_array.length }.by(1)
  end

  it "Will allow a working bike to be docked" do
    expect{
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)}.to change { subject.bike_array.length }.by(1)
  end

  it "Will respond to .release_broken_bikes" do
    expect(subject).to respond_to(:release_broken_bikes)
  end

  it "Will release only broken bikes when .release_broken_bikes method is called" do
    subject.dock(Bike.new)
    subject.dock(Bike.new(false))
    subject.dock(Bike.new)
    subject.dock(Bike.new(false))
    expect{subject.release_broken_bikes}.to change { subject.bike_array.length }.by(-2)
  end


end

# The below is an alternate way of writing the test for responding to a method
# describe DockingStation do   # note how DockingStation here is not in inverted commas
#   it { is_expected.to respond_to(:release_bike) }
# end
