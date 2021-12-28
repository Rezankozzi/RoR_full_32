# frozen_string_literal: true

class CargoWagon < Wagon
  def self.param_capacity
    [122, 138, 250, 120]   # объем вагона в кубических метрах, который может иметь грузовой вагон
  end

  def initialize(number, capacity)
    @type = :cargo
    super
  end

  def load_wagon(load)
    self.loaded_capacity += load
  end

  def info
    "Номер: #{number}  тип: #{type}  " \
    "свободный объем: #{available_capacity}  занятый объем: #{loaded_capacity}"
  end
end
