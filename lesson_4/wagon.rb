class Wagon
  attr_reader :type,



  def initialize(number, type)
    @number = number
    @type = type
    @condition = :free
    puts "Вагон  <<#{number}> создан!"
  end

  def hook(train)
    @train = train.number
    @condition = :hooking
  end

  def unhook(train)
    @train.delete(train)
    @condition = :free
  end
end

class PassengerWagon < Wagon
  def initialize
    super(number, :passenger)
  end
end

class CargoWagon < Wagon
  def initialize
    super(number, :cargo)
  end
end
