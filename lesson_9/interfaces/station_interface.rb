# frozen_string_literal: true

module StationInterface
  private

  def create_station
    number = input_user("\nВедите название станции в формате <<ST-**(две цифры)>>:")
    Station.new(number)
  end

  def station_info
    station = select_station('Выбор станции для  получения информации о ней.')
    puts 'Список поездов для выбранной станции:'
    station.each_train { |train| puts train.info }
  end
end
