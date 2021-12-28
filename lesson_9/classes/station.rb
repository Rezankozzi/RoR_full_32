# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :trains, :number

  class << self
    def all_stations
      @all_stations ||= []
    end

    def data_validation
      return unless validations.empty?

      validate :number, :presence
      validate :number, :format, /^ST-?\d{2}$/
    end
  end

  def initialize(number)
    @number = number
    @trains = []
    self.class.data_validation
    validation
    register_instance
  end

  def arrival(train)
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.type = type }
  end

  def each_train(&block)
    trains.each(&block)
  end

  private

  def validation
    return unless valid?

    self.class.all_stations << self
    puts "#{self} is created!"
  end
end
