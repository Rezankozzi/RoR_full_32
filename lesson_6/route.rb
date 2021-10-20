class Route
  include InstanceCounter
  include Validation

  NUMBER_FORMAT =/^RT-\d{3}$/

  attr_reader :stations, :name

  def initialize(first_station, final_station, number)
    @stations = [first_station, final_station]
    @number = number
    valide?
    register_instance
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

  private

  def validate!
  raise "Number has invalid format!"  if @number !~ NUMBER_FORMAT
  end
end
