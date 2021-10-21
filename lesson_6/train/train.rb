class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_reader  :speed, :wagons, :current_station, :name, :type, :route

  NUMBER_FORMAT = /^[\w^_]{3}-?[\w^_]{2}$/
  TYPE_FORMAT = [:cargo, :passenger]
  @@trains = []

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    validate!
    @@trains << self
    register_instance
  end

  def self.find(name)
     @@trains.find {|train| train.name == name}
  end

  def accelerate(vol)
    @speed += vol
  end

  def stop
    @speed = 0
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end

  def add_route(route)
    @route = route
    current_station
    @current_station.arrival(self)
  end

  def forward
    @current_station.departure(self)
    @current_station = @route.stations[@current_station_index+1]
    @current_station.arrival(self)
  end

  def back
    @current_station.departure(self)
    @current_station = @route.stations[@current_station_index-1]
    @current_station.arrival(self)
  end

  def add_wagon(wagon)
    if @speed == 0
       @wagons << wagon
    else
       puts "Прицепить вагон не возможно! Скорость поезда  должна быть равна 0"
    end
  end

  def delete_wagon(wagon)
    if @speed == 0
       @wagons.delete(wagon)
    else
       puts "Отцепить  вагон  не возможно! Скорость поезда  должна быть равна 0"
    end
  end

  private

  def validate!
    errors = []
    errors << "Number has invalid format!"  if @number !~ NUMBER_FORMAT
    errors << "Type has invalid format!" if TYPE_FORMAT.include?(@type) == false
    raise errors.join(' ') unless errors.empty?
  end

  def current_station
    @current_station = @route.stations[0]
    @current_station_index = @route.stations.index(@current_station)
  end
end
