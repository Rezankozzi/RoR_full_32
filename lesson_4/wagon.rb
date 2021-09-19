class Wagon
  attr_reader :type, :condition, :number

  def initialize(number, type)
    @number = number
    @type = type
    @condition = :free
    puts "\nВагон <<#{number}> создан!"
  end

  def hook(train)
    @train = train.number
    @condition = :hooking
  end

  def unhook(train)
    @train.delete(train.number)
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
