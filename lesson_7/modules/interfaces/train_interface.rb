module TrainInterface
  private

  def create_train
    type = input_user("\nВведите тип поезда: пассажирский-'passenger' или грузовой-'cargo':").to_sym
    name = input_user("\nВведите  номер поезда :").to_sym
    @trains << Train.new(name, type)
    puts "Поезд #{name} тип:#{type} создан!"
  rescue RuntimeError => e
    puts e.inspect
    puts "Проверьте данные поезда и повторите ввод!"
    retry
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
    wagon = select(train.wagons, "вагонов", "вагона")
    train.delete_wagon(wagon)
  end

  def moving
    direction = input_user("Для перемещения введите: вперед--'forward' : назад--'back'").to_sym
    train = select_train
    train.send direction
  end

  def wagons_info
    train = select_train
    puts "Список вагонов для выбранного поезда:"
    train.each_wagon{ |wagon| puts wagon.info}
  end
end
