class Train
  attr_reader  :speed, :wagons_count, :current_station, :number, :type

  def initialize(number, type, wagons_count)
    @number = number
    @type = type
    @wagons_count = wagons_count
  end

  def accelrate(volue)
    @speed +=volue
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
  end

  def forward
    @current_station_index += 1
  end

  def back
    @current_station_index -= 1
  end

  def hook_wagon
    if @speed == 0
       @wagons_count +=1
    else
       puts "Прицепить вагон не возможно! Скорость поезда  должна быть равна 0"
    end
  end

  def unhook_wagon
    if @speed == 0
       @wagons.count -=1
    else
       puts "Отцепить  вагон  не возможно! Скорость поезда  должна быть равна 0"
    end
  end
end
