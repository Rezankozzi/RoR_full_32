class Route_interface

  ROUTE_INTERFACE = ["\nМеню операций с маршрутом:",
                     "\nСоздать новый маршрут--' create '",
                     "Добавить станцию в  маршрут--'add'",
                     "Удалить станцию из маршрута--'delete'",
                     "Выйти из меню--'exit'"]




  def initialize
    @routes = []
    @selected_route = nil
  end

  def input_user(text)
    print text
    STDIN.gets.encode("UTF-8").chomp
  end
  
  def entry
    loop do
      puts ROUTE_INTERFACE
      send input_user("\nВведите название операции:").to_sym
    end 
  end

  def create
    10.times do #######################################################3  delete ######################
    begin_station = $station_interface.select_station
    final_station = $station_interface.select_station###################################################

    #  begin_station = $station_interface.select_station("\nВведите начальную станцию")
    # final_station = $station_interface.select_station("\nВведите конечную станцию")
    @routes << Route.new(begin_station, final_station)
    end


  end

  def select_route

    @selected_route = @routes.sample   ################################333   delete  ##############
=begin if @routes.empty? == true
      puts "\nСписок маршрутов пуст!"
      create
    end
    routes_list
    route_number = input_user("\nВведите номер маршрута из списка:").to_sym
    @routes.each  do | x |
    @selected_route = x if x.number == route_number
=end
  end

  def add

=begin if $station_interface.stations.size == 2
      puts "Для добавления в маршрут не хватает одной станции!"
      $station_interface.create
=end
    select_route
     station = $station_interface.select_station

    @selected_route.add_station(station)#("\nВыберите странцию для добавления."))
  end

  def delete
    select_route #if @selected_route ==  nil
    station = $station_interface.select_station

    @selected_route.delete_station(station)########("Выберите странцию для удаления."))
  end  

  def routes_list
    stations = []
    @routes.each do |route|
      route.stations.each {|x| stations << x.name}
      puts "\nМаршрут №: #{route.number} включает в себя станции: #{stations.join(",")}"
    end
  end
end
