# frozen_string_literal: true

module WagonInterface
  DATA_WAGON = { cargo: :create_cargo_wagon, passenger: :create_passenger_wagon }.freeze

  private

  def create_wagon
    type = input_user('Введите тип вагона :').to_sym
    send DATA_WAGON[type]
  end

  def create_cargo_wagon
    capacity = input_user('Введите объем вагона (м.куб), возможные значения 120, 122, 138, 250 :').to_i
    number = "WG-#{rand(100..150)}"
    CargoWagon.new(number, capacity)
  end

  def create_passenger_wagon
    seats = input_user('Введите количество пассажирских мест, возможные значения 10, 43, 54, 63, 68 шт. :').to_i
    number = "WG-#{rand(151..200)}"
    PassengerWagon.new(number, seats)
  end

  def take_a_seat
    select_wagon(:passenger).take_a_seat
  end

  def load_wagon
    load = input_user('Введите объем загрузки:').to_i
    select_wagon(:cargo).load_wagon(load)
  end
end
