class Van

  def transfer_broken_bikes(docking_station, garage)
    docking_station.release_broken_bikes.each do |bike|
      garage.bikes_in_garage << bike
    end
    garage.fix_all_bikes
  end

  def transfer_fixed_bikes(garage, docking_station)
    bikes_in_transit = garage.bikes_in_garage
    garage.bikes_in_garage = []
    bikes_in_transit.each do |bike|
      docking_station.dock(bike)
    end
  end

end
