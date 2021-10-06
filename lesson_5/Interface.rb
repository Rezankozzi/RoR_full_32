class Interface
  MENU = [{ index: 1, title: "Создать станцию", action: :create_station },
          { index: 2, title: "Создать поезд", action: :create_train },
          { index: 3, title: "Создать маршрут", action: :create_route },
          { index: 4, title: "Назначить поезду маршрут", action: :train_add_route },
          { index: 5, title: "Добавить к поезду вагон", action: :train_add_wagon },
          { index: 6, title: "Отцепить вагон от поезда", action: :train_delete_wagon },
          { index: 7, title: "Переместить поезд", action: :train_moving },
          { index: 8, title: "Добавить в маршрут станцию", action: :route_add_station },
          { index: 9, title: "удалить станцию из маршрута", action: :route_delete_station },
          { index: 10, title: "Просмотреть список станций и список поездов на станции", action: :station_info }
         ].freeze
                      
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def entry
   loop do
     puts "\nГлавное меню:"
     MENU.each { |item| puts "#{item[:index]} -- #{item[:title]}" }
     puts "Чтобы завершить работу введите 'exit'"
     choise = input_user("Введите номер пункта меню:")
     break if choise == "exit"
     hash_with_metod = MENU.find {|item| item[:index] == choise.to_i } # Получение хэша с выбранным названием метода
     send hash_with_metod[:action]
    end
  end

  private

  def create_station
    name = input_user("\nВедите название станции:")
    @stations << Station.new(name)
    puts "Станция #{name}создана!" 
  end 

  def create_train
    type = input_user("\nВведите тип поезда: пассажирский-'passenger' или грузовой-'cargo':").to_sym
    name = input_user("\nВведите  номер поезда:").to_sym
    @trains << Train.new(name, type)
    puts "Поезд #{name} тип:#{type} создан!"
  end

  def create_route
    puts "Введите начальную станцию."
    first_station = select(@stations, "станций", "станции")
    puts "Введите конечную станцию."
    final_station = select(@stations, "станций", "станции")
    name = input_user("Введите название маршрута:")
    @routes << Route.new(first_station, final_station, name)
    puts "\nМаршрут  #{name}:#{first_station.name}-#{final_station.name} создан!"
  end

  def input_user(text)
    print text
    STDIN.gets.encode("UTF-8").chomp
  end

  def train_add_route
    train = select(@trains, "поездов", "поезда")
    route = select(@routes, "маршрутов", "маршрута")
    train.add_route(route)
  end

  def train_add_wagon
    train = select(@trains, "поездов", "поезда" )
    train.add_wagon(Wagon.new("WG#{rand(50..70)}", train.type))
  end

  def train_delete_wagon
    train = select(@trains, "поездов", "поезда")
    wagon = select(train.wagons, "вагонов", "вагона")
    train.delete_wagon(wagon)    
  end

  def train_moving
    direction = input_user("Для перемещения введите: вперед--'forward' : назад--'back'").to_sym
    train = select(@trains, "поездов", "поезда")
    train.send direction
  end  

  def route_add_station
    station = select(@stations, "станций", "станции")
    route = select(@routes, "маршрутов", "маршрута")
    route.add_station(station)
  end

  def route_delete_station
    route = select(@routes, "маршрутов", "маршрута")
    station = select(route.stations, "станций", "станции")
    route.delete_station(station)
  end

  def station_info 
    station = select(@stations, "станций", "станции")
    puts "Список поездов для выбранной станции:"
    station.trains.each do |train|
    print "\nПоезд #{train.name} тип:#{train.type} количество вагонов:#{train.wagons.size} "
    print "маршрут:#{train.route.stations.first.name}-#{train.route.stations.last.name}"
    end
  end

  def select(objects, text1, text2)
    puts "Список #{text1} :"
    objects.each {|object| puts object.name}
    name = input_user("Введите имя #{text2} из списка:")
    objects.find {|object| name == object.name}
  end
end