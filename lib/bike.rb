class Bike

  def initialize
  	@working = true
  end

  def working?
    @working
  end

  def update_to_broken
    @working = false
  end
end
