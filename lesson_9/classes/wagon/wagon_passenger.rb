# frozen_string_literal: true

class PassengerWagon < Wagon
  def self.param_capacity
    [54, 63, 68, 10, 43]  # количество мест, которое может иметь пассажирский вагон
  end

  def initialize(number, capacity)
    @type = :passenger
    super
  end

  def take_a_seat
    self.loaded_capacity += 1
  end

  def info
    "Номер: #{number}  тип: #{type}  " \
    "свободных мест: #{available_capacity}  занятых мест: #{loaded_capacity}"
  end
end
