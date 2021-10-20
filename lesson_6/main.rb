  require_relative "./interface.rb"
  require_relative "./modules/manufacturer.rb"
  require_relative "./modules/instance_counter.rb"
  require_relative "./modules/validation.rb"
  require_relative "./train/train.rb"
  require_relative "./train/train_cargo.rb"
  require_relative "./train/train_passenger.rb"
  require_relative "./station.rb"
  require_relative "./route.rb"

  interface = Interface.new
  interface.entry