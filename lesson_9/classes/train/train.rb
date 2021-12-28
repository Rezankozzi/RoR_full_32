# frozen_string_literal: true

class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  extend Accessors

  attr_reader :speed, :wagons, :number, :type, :route

  class << self
    def data_validation
      return unless validations.empty?

      validate :number, :presence
      validate :number, :format, /^[\w^_]{3}-?[\w^_]{2}$/
    end

    def all_trains
      @all_trains ||= []
    end

    def find(name)
      all_trains.find { |train| train.name == name }
    end
 end

  def initialize(number)
    @number = number
    @speed = 0
    @wagons = []
    self.class.data_validation
    validation
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

  def all_wagons(&block)
    wagons.each(&block)
  end

  def info
    "Номер:#{number} тип:#{type} количество вагонов:#{wagons.size}"
  end

  private

  def validation
    return unless valid?

    Train.all_trains << self
    puts "#{self} is created!"
  end

  def current_station
    route.stations[@current_station_index]
  end
end
