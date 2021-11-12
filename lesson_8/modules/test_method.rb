# frozen_string_literal: true

#   в test_method  создаются поезда двух типов, к ним прицепляются по пять вагонов соответствующего типа.
#   этим поездам назначаются два маршрута-прямой и обратный, состоящие  из двух станций.
module TestMethod
  def test_method
    station1 = Station.new("ST#{rand(10..100)}")
    station2 = Station.new("ST#{rand(10..100)}")
    @stations << station1 << station2
    route1 = Route.new(station1, station2, "RT-#{rand(100..300)}")
    route2 = Route.new(station2, station1, "RT-#{rand(100..300)}")
    @routes << route1 << route2
    train1 = Train.new("TRa-#{rand(20..30)}", :cargo)
    train2 = Train.new("TRa-#{rand(31..40)}", :passenger)
    @trains << train1 << train2
    train1.add_route(route1)
    train2.add_route(route2)
    5.times do
      wagon_cargo = CargoWagon.new("WG-#{rand(100..150)}", [30, 40, 70].sample)
      train1.add_wagon(wagon_cargo)
      wagon_pass = PassengerWagon.new("WG-#{rand(150..200)}", [40, 60, 120].sample)
      train2.add_wagon(wagon_pass)
      @wagons << wagon_cargo << wagon_pass
    end
  end
end
