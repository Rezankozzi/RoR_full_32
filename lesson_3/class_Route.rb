class Route
  attr_reader :station

  def initialize(begin_station, final_station)
    @stations = [begin_station, final_station]
  end

  def add_station(station)
    @station.insert(-2)
  end

  def delete_station(station)
    @station.delete(station)
  end

  def print_station
    puts  @stations.to_s
  end
end
