class Station_interface < Train_interface
  attr_reader :stations

  STATION_INTERFACE = ["\nМеню управления станциями:",
                       "\nСоздать новую странцию--'create'",
                       "Список станций--'list'",
                       "Список поездов на станции--'trains'",
                       "Выйти из меню--'exit'"]

  def initialize
    @stations = []
    @selected_station = nil
  end  

  def list
    puts "\nСписок имеющихся станций:\n"
    @stations.each {|station| puts "#{station.name}"}
  end 

  def trains
    puts "\nИнформация о находящихся на выбранной станции поездах.\n"
    select_station("Ведите название станции:")
    type = [:cargo, :passenger]
    type.each {|x| puts @selected_station.trains_by_type(x)}
  end

  def entry
    @selected_station = nil
    loop do
      cls
      puts STATION_INTERFACE
      choice = input_user("Введите название операции:").to_sym
      if  choice == :exit
        break
      else
        send choice
      end
    end
  end

  def create
    @stations << Station.new(input_user("\nВедите название станции:").to_s)
  end

  def select_station(text)
    if  @stations.empty? == true
      puts "\nСписок станций пуст!"
      create
    elsif @stations.size < 2
      puts "\nДля создания маршрута необходимо наличие еще одной станции!"
      create
    end
    list
    name_station = input_user(text)
    @stations.each do |x|
      @selected_station = x if x.name == name_station
    end
  end
end

