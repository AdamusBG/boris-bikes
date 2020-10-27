require_relative './bike'


class DockingStation
  attr_reader :bike_array

  def initialize
  	@bike_array = []
  end


  def release_bike
  	if @bike_array.empty?
  	  raise StandardError.new "There were no bikes in the docking station"
  	else
      Bike.new
    end
  end

  def dock(bike)
  	if @bike_array.empty?
  	  @bike_array.push(bike)
  	else
  	  raise StandardError.new "You cannot dock a bike, this station already contains one"
  	end
  end

end

