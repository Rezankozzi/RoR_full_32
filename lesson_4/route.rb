class Route
  attr_reader :stations, :number

  def initialize(begin_station, final_station)
    @stations = [begin_station, final_station]
    @number = "rt" + rand(10..20).to_s
    print "\nМаршрут  <<#{@number}>> создан!"
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
