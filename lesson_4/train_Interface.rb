class Train_interface

  TRAIN_INTERFACE_MENU = ["\nОперации с поездами:\n",
                          "\nСоздать новый поезд--'create'",
                          "Выбрать поезд из уже созданных--'select'",
                          "Выйти из меню--'exit'"]

  TRAIN_MENU = ["\nМеню управления поездами:\n",
                "Назначить поезду маршрут--'route'",
                "Переместить поезд по маршруту--'moving'",
                "Изменить скорость поезда--'speed'",
                "Прицепить вагон--'hook'",
                "Отцепить вагон--'unhook'",
                "Выйти из меню--'exit'"]

  def initialize
    @trains = []
    @selected_train = nil
  end

  def input_user(text)
    print text
    STDIN.gets.encode("UTF-8").chomp
  end

  def cls
    system('cls') || system('clear')
  end
  
  def route
    selected_route = $route_interface.select_route
    @selected_train.add_route(selected_route)
  end

  def moving
    if @selected_train.route == nil
      puts "Выбранному поезду не назначен маршрут. Движение без маршрута невозможно!"
      return
    end
    @selected_train.send input_user("\nПереместить поезд вперед по маршруту--'forward', назад--'back").to_sym
  end  

  def speed
    speed = input_user("\nВведите новое значение скорости поезда:").to_i
    @selected_train.stop if speed == 0
    @selected_train.speed(speed)
  end

  def hook
    type = @selected_train.type
    wagon = $wagon_interface.select_wagon(type)
    @selected_train.hook_wagon(wagon)
  end

  def unhook
    type = @selected_train.type
    wagon = $wagon_interface.select_wagon(type)
    @selected_train.unhook_wagon(wagon)
  end

  def trains_list
    puts "\nСписок имеющихся поездов:\n"
    @trains.each  do |train|
    puts "Поезд №:#{train.number} тип:#{train.type} "
    end
  end

  def create
    cls
    train_type = input_user("\nВведите тип поезда: пассажирский-'passenger' или  грузовой-'cargo' :").to_sym
    train_number = "tr" + rand(10..50).to_s
    @trains << Train.new(train_number, train_type)
  end

  def select
    if @trains.empty? == true
      puts "Список поездов пуст. Необходимо создать новый поезд."
      create
    end
    trains_list
    train_number = input_user("Введите номер поезда из списка:")
    @trains.each do |x|
      @selected_train = x if x.number == train_number
    end

    loop do
      puts TRAIN_MENU
      send input_user("\nЧто вы хотите сделать с выбранным поездом:").to_sym
    end
  end


  def entry
    @selected_train = nil
    loop do
      puts TRAIN_INTERFACE_MENU
      choice = input_user("\nВведите название операции:").to_sym
      if  choice == :exit
        break
      else
        send choice
      end
    end
  end

end