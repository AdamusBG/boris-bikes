class Garage
  attr_accessor :bikes_in_garage

  def initialize
    @bikes_in_garage = []
  end

  def fix_all_bikes
    @bikes_in_garage.each{|bike| bike.repair}
  end

end
