# frozen_string_literal: true

module TrainInterface
  private

  def create_train
    type = input_user("\nInput train type: 'passenger' or 'cargo':").to_sym
    name = input_user("\nInput train number (format <<***-**>>):").to_sym
    send "create_#{type}_train", name
  end

  def create_cargo_train(number)
    CargoTrain.new(number)
  end

  def create_passenger_train(number)
    PassengerTrain.new(number)
  end

  def add_route
    train = select_train
    route = select_route
    train.add_route(route)
  end

  def add_wagon
    train = select_train
    wagon = select_wagon(train.type)
    train.add_wagon(wagon)
  end

  def delete_wagon
    train = select_train
    wagon = select(train.wagons, 'вагонов', 'вагона')
    train.delete_wagon(wagon)
  end

  def moving
    direction = input_user("Для перемещения введите: вперед--'forward' : назад--'back'").to_sym
    train = select_train
    train.send direction
  end

  def wagons_info
    train = select_train
    puts 'Список вагонов для выбранного поезда:'
    train.all_wagons { |wagon| puts wagon.info }
  end
end
