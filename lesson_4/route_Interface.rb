class Route_interface < Train_interface

  ROUTE_INTERFACE = ["\nМеню операций с маршрутом:",
                     "\nСоздать новый маршрут--'create'",
                     "Добавить станцию в  маршрут--'add'",
                     "Удалить станцию из маршрута--'delete'",
                     "Выйти из меню--'exit'"]

  def initialize
    @routes = []
    @selected_route = nil
  end 

  def add
    select_route if @selected_route == nil
    if $station_interface.stations.size == 2
      puts "Для добавления в маршрут не хватает одной станции!"
      $station_interface.create
    end
    station = $station_interface.select_station("\nВыберите станцию для добавления.")
    @selected_route.add_station(station)
  end

  def delete
    select_route if @selected_route ==  nil
    station = $station_interface.select_station("Выберите странцию для удаления.")
    @selected_route.delete_station(station)
  end

  def routes_list
    puts "\nСписок имеющихся маршрутов:"
    stations = []
    @routes.each do |route|
     route.stations.each {|x| stations << x.name}
     puts "\nМаршрут #{route.number} : #{stations.join("-")}"
    end
  end

  def entry
    loop do
      puts ROUTE_INTERFACE
      choice = input_user("\nВведите название операции:").to_sym
      if  choice == :exit
        break
      else
        send choice
      end
    end
  end

  def create
    begin_station = $station_interface.select_station("\nВведите начальную станцию:")
    final_station = $station_interface.select_station("\nВведите конечную станцию:")
    @routes << Route.new(begin_station, final_station)
  end

  def select_route
    if @routes.empty? == true
      puts "\nСписок маршрутов пуст!"
      create
    end
    routes_list
    route_number = input_user("\nВведите номер маршрута из списка:").to_sym
    @routes.each  do | x |
      return x if x.number == route_number
    end
  end
end








