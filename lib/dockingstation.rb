require_relative './bike'


class DockingStation
  attr_reader :bike_array, :capacity

  def initialize(capacity = 20)
  	@bike_array = []
  	@capacity = capacity
  end


  def release_bike
  	if @bike_array.empty?
  	  raise StandardError.new "There were no bikes in the docking station"
  	else
      @bike_array.each_with_index { |bike, index|
        if bike.working?
          @bike_array.delete_at(index)
          return bike
        end
      }
      raise StandardError.new "All the bikes in the docking station were broken"
    end
  end

  def dock(bike, working = true)
  	if @bike_array.length < @capacity && working == true
  	  @bike_array.push(bike)
  	elsif @bike_array.length < @capacity && working == false
  	  bike.update_to_broken # need to implement this
      @bike_array.push(bike)
  	else
  	  raise StandardError.new "You cannot dock a bike, this station is already at capacity"
  	end
  end


end

