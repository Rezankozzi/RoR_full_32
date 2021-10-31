class CargoWagon < Wagon
  attr_reader :capacity
  attr_accessor :unavailable_capacity

  def initialize(number, capacity)
    @number = number
    @type = :cargo
    @capacity = capacity
    @unavailable_capacity = 0
  end

  def available_capacity
    @capacity - @unavailable_capacity
  end

  def info
    "Номер: #{@number}  тип: #{@type} свободный объем: #{available_capacity} занятый объем: #{@unavailable_capacity}"
  end
end