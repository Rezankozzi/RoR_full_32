# frozen_string_literal: true

module DataInterface
  DATA_MENU = { 'main' => [{ index: 1, title: 'Станция', action: 1 },
                           { index: 2, title: 'Поезд', action: 2 },
                           { index: 3, title: 'Маршрут', action: 3 },
                           { index: 4, title: 'Вагон', action: 4 }],
                1 => [{ index: 1, title: 'Создать станцию', action: :create_station },
                      { index: 2, title: 'Перечень станций и список поездов на станции', action: :station_info }],
                2 => [{ index: 1, title: 'Создать поезд', action: :create_train },
                      { index: 2, title: 'Назначить поезду маршрут', action: :add_route },
                      { index: 3, title: 'Добавить к поезду вагон', action: :add_wagon },
                      { index: 4, title: 'Отцепить вагон от поезда', action: :delete_wagon },
                      { index: 5, title: 'Переместить поезд', action: :moving },
                      { index: 6, title: 'Просмотреть список вагонов поезда', action: :wagons_info }],
                3 => [{ index: 1, title: 'Создать маршрут', action: :create_route },
                      { index: 2, title: 'Добавить в маршрут станцию', action: :add_station },
                      { index: 3, title: 'удалить станцию из маршрута', action: :delete_station }],
                4 => [{ index: 1, title: 'Создать вагон', action: :create_wagon },
                      { index: 2, title: 'Занять место в вагоне', action: :take_a_seat },
                      { index: 3, title: 'Занять объем в вагоне', action: :load_wagon }] }.freeze
end
