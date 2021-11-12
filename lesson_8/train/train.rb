# frozen_string_literal: true

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^[\w^_]{3}-?[\w^_]{2}$/.freeze

  attr_reader :speed, :wagons, :number, :type, :route

  @@trains = []

  def self.trains
    @@trains
  end

  def self.find(name)
    trains.find { |train| train.name == name }
  end

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    validate!
    @@trains << self
    register_instance
  end

  def accelerate(vol)
    speed(vol)
  end

  def stop
    speed(0)
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  def previous_station
    route.stations[@current_station_index - 1]
  end

  def add_route(route)
    @route = route
    @current_station_index = 0
    current_station.arrival(self)
  end

  def forward
    current_station.departure(self)
    current_station = route.stations[@current_station_index + 1]
    current_station.arrival(self)
  end

  def back
    current_station.departure(self)
    current_station = route.stations[@current_station_index - 1]
    current_station.arrival(self)
  end

  def add_wagon(wagon)
    puts 'Операцитя невозможна! Скорость поезда  не равна 0!' if speed.zero? != true
    wagons << wagon
  end

  def delete_wagon(wagon)
    puts 'Операцитя невозможна! Скорость поезда  не равна 0!' if speed.zero? != true
    wagons.delete(wagon)
  end

  def each_wagon(&block)
    wagons.each(&block)
  end

  def info
    "Номер:#{number} тип:#{type} количество вагонов:#{wagons.size}"
  end

  private

  def validate!
    errors = []
    errors << 'Number has invalid format!' if number !~ NUMBER_FORMAT
    errors << 'Type has invalid format!' if TYPE_FORMAT.include?(type) == false
    raise errors.join(' ') unless errors.empty?
  end

  def current_station
    route.stations[@current_station_index]
  end
end
