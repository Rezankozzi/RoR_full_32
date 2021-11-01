class Interface
  include DataInterface
  include TrainInterface
  include StationInterface
  include RouteInterface
  include WagonInterface
  include TestMethod  #  модуль, подключающий тестовый метод

  def initialize
    @trains = []
    @stations = []
    @routes = []
    @wagons = []
    @menu = []
  end

  def entry
  loop do
    get_menu("main")
    choise = make_choise
    break if choise == "exit"
    main_menu(choise)
    end
  end

  def main_menu(number)
    loop do
      get_menu(number)
      choise = make_choise
      break if choise == "exit"
      send choise
    end
  end

  private

  def make_choise
    choise = input_user("Введите номер пункта меню:")
    return choise if choise == "exit"
    hash_with_method = @menu.find {|item| item[:index] == choise.to_i }
    hash_with_method[:action]
  end

  def get_menu(key)
    @menu = DATA_MENU[key]
    @menu.each { |item| puts "#{item[:index]} -- #{item[:title]}" }
    puts "Чтобы завершить работу введите 'exit'"
  end

  def input_user(text)
    print text
    STDIN.gets.encode("UTF-8").chomp
  end

  def select_station
    select(@stations, "станций", "станции")
  end

  def select_route
    select(@routes, "маршрутов", "маршрута")
  end

  def select_train
    select(@trains, "поездов", "поезда")
  end

  def select_wagon(type)
    wagons = @wagons.select{|wagon| wagon.type == type}
    select(wagons, "вагонов", "вагона")
  end

  def select(objects, text1, text2)
    puts "Список #{text1} :"
    objects.each {|object| puts object.number}
    number = input_user("Введите номер #{text2} из списка:")
    objects.find {|object| number == object.number}
  end
end