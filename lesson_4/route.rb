class Route
  attr_reader :stations, :name

  def initialize(first_station, final_station, name)
    @stations = [first_station, final_station]
    @name = name
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def print_station
    puts  @stations.to_s
  end
end
