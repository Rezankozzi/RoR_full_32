  require_relative "./modules/interfaces/train_interface.rb"
  require_relative "./modules/interfaces/station_interface.rb"
  require_relative "./modules/interfaces/route_interface.rb"
  require_relative "./modules/interfaces/wagon_interface.rb"
  require_relative "./modules/interfaces/menu_interface.rb"
  require_relative "./modules/test_method.rb" # подключение тестового метода для создания и связывания между собой
                                              # нескольких тестовых объектов.
  require_relative "./interface.rb"
  require_relative "./modules/manufacturer.rb"
  require_relative "./modules/instance_counter.rb"
  require_relative "./modules/validation.rb"
  require_relative "./train/train.rb"
  require_relative "./train/train_cargo.rb"
  require_relative "./train/train_passenger.rb"
  require_relative "./station.rb"
  require_relative "./route.rb"
  require_relative "./wagon/wagon.rb"
  require_relative "./wagon/wagon_cargo.rb"
  require_relative "./wagon/wagon_passenger.rb"


  interface = Interface.new
  interface. test_metod  #  вызов тестового метода
  interface.entry


