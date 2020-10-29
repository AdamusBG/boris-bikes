require 'van'
require 'dockingstation'
require 'garage'
require 'bike'

describe Van do


  it "Is an instance of the van class" do
    expect(subject).to be_instance_of(Van)
  end

  context "#transfer_broken_bikes" do

    it "Responds to .transfer_broken_bikes" do
      expect(subject).to respond_to(:transfer_broken_bikes).with(2).arguments
    end

    it "Will take broken bikes from docking station" do
      station = DockingStation.new
      station.dock(Bike.new)
      station.dock(Bike.new(false))
      station.dock(Bike.new)
      station.dock(Bike.new(false))
      expect{subject.transfer_broken_bikes(station, Garage.new)}.to change { station.bike_array.length }.by(-2)
    end

    it "Will put broken bikes into a garage" do
      station = DockingStation.new
      station.dock(Bike.new)
      station.dock(Bike.new(false))
      station.dock(Bike.new)
      station.dock(Bike.new(false))
      garage = Garage.new
      expect{subject.transfer_broken_bikes(station, garage)}.to change { garage.bikes_in_garage.length }.by(2)
    end

  end

  context "#transfer_fixed_bikes" do

    it "Responds to .transfer_fixed_bikes" do
      expect(subject).to respond_to(:transfer_fixed_bikes).with(2).arguments
    end

    it "Will remove all bikes from the garage when .transfer_fixed_bikes is called" do
      garage = Garage.new
      2.times {garage.bikes_in_garage << Bike.new}
      expect{subject.transfer_fixed_bikes(garage, DockingStation.new)}.to change { garage.bikes_in_garage.length }.by(-2)
    end

    it "Will put bikes into the docking station when .transfer_fixed_bikes is called" do
      garage = Garage.new
      2.times {garage.bikes_in_garage << Bike.new}
      station = DockingStation.new
      expect{subject.transfer_fixed_bikes(garage, station)}.to change { station.bike_array.length }.by(2)
    end

  end

end
