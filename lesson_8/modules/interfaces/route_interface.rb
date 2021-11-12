# frozen_string_literal: true

module RouteInterface
  private

  def create_route
    first_station = select_station('Введите начальную станцию.')
    final_station = select_station('Введите конечную станцию.')
    name = input_user('Введите название маршрута:')
    @routes << Route.new(first_station, final_station, name)
    puts "\nМаршрут  #{name}:#{first_station.name}-#{final_station.name} создан!"
  end

  def add_station
    station = select_station('Выбор станции для добавления')
    route = select_route
    route.add_station(station)
  end

  def delete_station
    route = select_route
    station = select(route.stations, 'станций', 'станции')
    route.delete_station(station)
  end
end
