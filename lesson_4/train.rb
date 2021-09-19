class Train
  attr_reader  :speed, :wagons, :current_station, :number, :type, :route

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    puts "Поезд номер №#{number}, тип :#{type}, создан!"
  end

  def accelerate(vol)
    @speed += vol
  end

  def stop
    @speed = 0
  end

  def current_station
    route.station.index(@current_station_index)
  end

  def next_station
    route.station.index(@current_station_index + 1)
  end

  def previous_station
    route.station.index(@current_station_index - 1)
  end

  def add_route(route)
    @route = route
    @current_station_index = 0
    puts "Маршрут #{route.number} для поезда #{self.number} назначен"
  end

  def forward                          
    @current_station_index += 1
    current_station.arrival(self)
  end

  def back
    @current_station_index -= 1
    current_station.departure(self)
  end

  def hook_wagon(wagon)
    if @speed == 0
       @wagons << wagon
       wagon.hook
    else
       puts "Прицепить вагон не возможно! Скорость поезда  должна быть равна 0"
    end
  end

  def unhook_wagon(wagon)
    if @speed == 0
       @wagons.delete(wagon)
    else
       puts "Отцепить  вагон  не возможно! Скорость поезда  должна быть равна 0"
    end
  end

end

class PassengerTrain < Train

  def initialize
    super(number, :passenger)
  end
end

class CargoTrain < Train

  def initialize
    super(number, :cargo)
  end
end