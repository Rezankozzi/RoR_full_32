# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :stations, :number

  class << self
    def data_validation
      return unless validations.empty?

      validate :number, :presence
      validate :number, :format, /^RT-\d{3}$/
      validate :stations, :equality
    end

    def all_routes
      @all_routes ||= []
    end
  end

  def initialize(first_station, final_station, number)
    @stations = [first_station, final_station]
    @number = number
    self.class.data_validation
    validation
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def print_station
    puts stations.to_s
  end

  private

  def validation
    return unless valid?

    self.class.all_routes << self
    puts "#{self} is created!"
  end
end
