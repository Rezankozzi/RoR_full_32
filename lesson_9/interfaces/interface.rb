# frozen_string_literal: true

class Interface
  include DataInterface
  include TrainInterface
  include StationInterface
  include RouteInterface
  include WagonInterface
  include TestModule #   модуль для различного тестирования

  def initialize
    @menu = []
  end

  def entry
    testing #  вызов тестов
    loop do
      puts "\n-------------------------------------------------------------------------------------------------"
      get_menu('main')
      choice = make_choice
      break if choice == 'exit'

      main_menu(choice)
    end
  end

  def main_menu(number)
    loop do
      get_menu(number)
      choice = make_choice
      break if choice == 'exit'

      send choice
    end
  end

  private

  attr_reader :menu

  def make_choice
    choice = input_user('Введите номер пункта меню:')
    if choice == 'exit'
      choice
    else
      hash_with_method = menu.find { |item| item[:index] == choice.to_i }
      hash_with_method[:action]
    end
  end

  def get_menu(key)
    @menu = DATA_MENU[key]
    @menu.each { |item| puts "#{item[:index]} -- #{item[:title]}" }
    puts 'Чтобы завершить работу введите "exit"'
  end

  def input_user(text)
    print text
    $stdin.gets.chomp
  end

  def select_station(text)
    print text
    select(Station.all_stations, 'станций', 'станции')
  end

  def select_route
    select(Route.all_routes, 'маршрутов', 'маршрута')
  end

  def select_train
    select(Train.all_trains, 'поездов', 'поезда')
  end

  def select_wagon(type)
    wagons = Wagon.all_wagons.select { |wagon| wagon.type == type }
    select(wagons, 'вагонов', 'вагона')
  end

  def select(objects, text1, text2)
    puts "Список #{text1} :"
    objects.each { |object| puts object.number }
    number = input_user("Введите номер #{text2} из списка:")
    objects.find { |object| number == object.number }
  end
end
