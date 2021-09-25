Здесь лежат файлы с выполненным заданием к уроку "Интерфейсы, наследование и полиморфизм"

Файлы с описанием классов: train.rb; train_cargo.rb, train_passenger.rb, station.rb; route.rb; wagon.rb, wagon_cargo.rb, wagon_passenger.rb 

Файл с описанием интерфейса: interface.rb

Файл запуска программы: main.rb

Для теста можно использовать тестовый блок. Вставить его в публичную область класса в файле interface.rb.  
def test_metod
    5.times do 
    @stations << Station.new( "ST#{rand(100) }" )
    end
    train = Train.new( "TR#{rand(20..30)}", [:cargo, :passenger].sample)
    @trains << train
    route = Route.new( @stations.first, @stations.last, "RT#{rand(20..30)}")
    @routes << route
    for item in (1..3)
    route.add_station(@stations[item])
    train.add_route(route)
    end
end

В файле  main.rb  вставить: interface.test_metod между строками 9-10
