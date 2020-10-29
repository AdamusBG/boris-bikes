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
  	if @bike_array.length < @capacity && working == true # returning a bike and not reporting it as broken
  	  @bike_array.push(bike)
  	elsif @bike_array.length < @capacity && working == false # returning a bike and reporting it as broken
  	  bike.update_to_broken
      @bike_array.push(bike)
  	else # trying to dock at full capacity
  	  raise StandardError.new "You cannot dock a bike, this station is already at capacity"
  	end
  end

  def release_broken_bikes
    bikes_to_be_fixed = []
    @bike_array.each_with_index do |bike, index|
      if !bike.working?
        bikes_to_be_fixed << bike
        @bike_array.delete_at(index)
      end
    end
    bikes_to_be_fixed
  end

end
