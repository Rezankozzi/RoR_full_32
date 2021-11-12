# frozen_string_literal: true

class CargoWagon < Wagon
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
