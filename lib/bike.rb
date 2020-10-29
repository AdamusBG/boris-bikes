class Bike

  def initialize(working = true)
  	@working = working
  end

  def working?
    @working
  end

  def update_to_broken
    @working = false
  end

  def repair
    @working = true
  end
end
