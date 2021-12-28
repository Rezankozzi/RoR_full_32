# frozen_string_literal: true

#   в test_method  создаются поезда двух типов, к ним прицепляются по пять вагонов соответствующего типа.
#   этим поездам назначаются два маршрута-прямой и обратный, состоящие  из двух станций.
module TestModule
  def testing
    Test_Accessors.new.begin
    # Test_Accessors - тестирование модуля Accessors.
    # create_object --  Создание объекта класса  CargoWagon, и сохранение его
    # attr_accessor_with_history -- динамическое создание геттера и сеттера для двух атрибутов :
    #     :station-станция назначения вагона( и соответствующий ему атрибут истории значений);
    #     :train-поезд к которому он сейчас прицеплен и список его "бышших хозяев".
    # test_attr_with_history -- атрибуту :train будут по очереди присваиваться номера поездов, с  которым вагон ездит,
    #                           с сохранением истории этих значений.
    # strong_attr_accessor -- динамическое добавление атрибута :driver (имя машиниста в формате "Mr. Jackson", то
    # есть String)
    # test_strong_attr_accessor -- призваивание атрибуту :driver разных типов значений и их валидация
    # -----------------------------------------------------------------------------------------------------
    Test_Create_Objects.new.begin
    # создание валидных объектов для тестирования работы с ними
  end

  class Test_Accessors
    attr_accessor :wagon, :name_driver

    def initialize
      @name_driver = [123, ['Mr. Jackson'], { Mr: 'Jackson' }, :MrJackson, 'Mr. Jackson']
    end

    def begin
      # create_object
      # test_attr_with_history
      # test_strong_attr_accessor
    end

    def create_object
      puts "\n---------------------------Создание объекта класса CargoWagon ------------------------------------"
      self.wagon = CargoWagon.new('WG-123', 250)
      puts wagon.inspect
    end

    def attr_accessor_with_history(*attr)
      puts "\n ------ инстанс-методы до динамического добавления атрибутов --------------------------------------"
      puts wagon.methods[0..15].to_s
      wagon.class.attr_accessor_with_history(*attr)
      puts "\n------------------инстанс-методы после динамического добавления атрибутов #{attr} ----------------"
      puts wagon.methods[0..15].to_s
    end

    def strong_attr_accessor(attr, klass)
      puts "\n ------ инстанс-методы до динамического добавления атрибута :#{attr} -----------------------------"
      puts wagon.methods[0..15].to_s
      wagon.class.strong_attr_accessor(attr, klass)
      puts "\n------------------инстанс-методы после  динамического добавления атрибута-------------------------"
      puts wagon.methods[0..15].to_s
    end

    def test_attr_with_history
      attr_accessor_with_history(:station, :train)
      4.times do
        wagon.train = "TR-#{rand(100..900)}"
        puts "\nТекущее значение номера поезда : #{wagon.train}"
        puts 'История всех значений в виде массива :'
        puts wagon.train_history.to_s
      end
    end

    def test_strong_attr_accessor
      strong_attr_accessor(:driver, String)
      puts "\n----------Поочередное присваивание атрибуту :driver значений из массива #{driver}------------"
      driver.each do |name|
        wagon.driver = name
      rescue RuntimeError => e
        puts e.inspect.to_s
      end
      puts "Значение @driver = #{wagon.driver}"
    end
  end

  class Test_Create_Objects
    def begin
      # create_wagons
      # create_trains
      # create_stations
      # create_routes
    end

    def create_trains
      puts "\n--------------------------------------------------------------------------------"
      3.times do
        CargoTrain.new("Tra-#{rand(10..99)}")
      PassengerTrain.new("Tra-#{rand(10..99)}")
      end
    end

    def create_stations
      puts "\n--------------------------------------------------------------------------------"
      10.times { Station.new("ST-#{rand(10..99)}") }
    end

    def create_wagons
      puts "\n--------------------------------------------------------------------------------"
      5.times do
        CargoWagon.new("WG-#{rand(100..999)}", [120, 122, 138, 250].sample)
        PassengerWagon.new("WG-#{rand(100..999)}", [54, 63, 68, 10, 43].sample)
      end
    end

    def create_routes
      puts "\n--------------------------------------------------------------------------------"
      4.times do
        Route.new(Station.all_stations.sample, Station.all_stations.sample, "RT-#{rand(100..999)}")
      end
    end
  end
end
