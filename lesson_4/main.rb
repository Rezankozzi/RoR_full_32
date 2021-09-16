  require_relative "./train_interface.rb"
  require_relative "./route_interface.rb"
  require_relative "./station_interface.rb"
  require_relative "./wagon_interface.rb"
  require_relative "./train.rb"
  require_relative "./station.rb"
  require_relative "./route.rb"
  require_relative "./wagon.rb"

  $train_interface = Train_interface.new
  $route_interface = Route_interface.new
  $station_interface = Station_interface.new
  $wagon_interface = Wagon_interface.new

  MAIN_MENU = ["\nЕсли это поезд--введите 'train'",
               "Если это станция--введите 'station'",
               "Если это маршрут--введите 'route'",
               "Если это вагон--введите 'wagon'",
               "Информация о станциях и поездах на них--введите 'info' ",
               "Закончить работу--введите 'stop'\n"]

  def input_user(text)     
    print text
    STDIN.gets.encode("UTF-8").chomp
  end

  def cls
    system('cls') || system('clear')
    sleep 1
  end

  def train
    cls
    $train_interface.entry
  end

  def route
    cls
    $route_interface.entry
  end

  def station
    cls
    $station_interface.entry
  end
    
  def wagon
    cls
    $wagon_interface.entry
  end

  def stop
    puts "Работы программы завершена!"
    abort
  end

  def info
    $station_interface.trains
  end

  loop do
    puts "\nВведите название объекта, с которым вы хотите работать:\n"
    MAIN_MENU.each{|x| puts x }
    send input_user("Ваш выбор:")
  end






