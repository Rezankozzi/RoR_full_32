# frozen_string_literal: true

class Wagon
  include Manufacturer
  include Validation
  extend Accessors

  attr_reader :type, :number, :capacity, :loaded_capacity

  class << self
    def data_validation
      return unless validations.empty?

      validate :number, :presence
      validate :number, :format, /^WG-\d{3}$/
      validate :capacity, :value, param_capacity
    end

    def all_wagons
      @all_wagons ||= []
    end
  end

  def initialize(number, capacity)
    @loaded_capacity = 0
    @number = number
    @capacity = capacity
    self.class.data_validation
    validation
  end

  def available_capacity
    capacity - loaded_capacity
  end

  private

  def validation
    return unless valid?

    Wagon.all_wagons << self
    puts "#{self} is created!"
  end

  attr_writer :loaded_capacity
end
