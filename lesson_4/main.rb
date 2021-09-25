  require_relative "./interface.rb"
  require_relative "./train.rb"
  require_relative "./train_cargo.rb"
  require_relative "./train_passenger.rb"
  require_relative "./station.rb"
  require_relative "./route.rb"
  require_relative "./wagon.rb"

  interface = Interface.new
  interface.entry