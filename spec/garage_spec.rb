require 'garage'
require 'bike'

describe Garage do
  let(:bike) { double :bike }

  it "Is instance of Garage class" do
    expect(subject).to be_instance_of(Garage)
  end

  it "New garage has no bikes in store" do
    expect(subject.bikes_in_garage.length).to eq(0)
  end

  it "Has one bike in storage after bike is added" do
  expect{
    subject.bikes_in_garage << bike}.to change { subject.bikes_in_garage.length }.by(1)
  end

  it "Fixes all bikes in garage when .fix_all_bikes is called" do
    subject.bikes_in_garage << Bike.new
    subject.bikes_in_garage << Bike.new(false)
    subject.bikes_in_garage << Bike.new
    subject.bikes_in_garage << Bike.new(false)
    subject.fix_all_bikes
    subject.bikes_in_garage.each do |bike|
      expect(bike.working?).to eq(true)
    end
  end

end
