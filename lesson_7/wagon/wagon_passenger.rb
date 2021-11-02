class PassengerWagon < Wagon
  def initialize(number, capacity)
    @type = :passenger
    super
  end

  def take_a_seat
    self.loaded_capacity += 1
  end

  def info
    "Номер: #{@number}  тип: #{@type}  " +
      "свободных мест: #{available_capacity}  занятых мест: #{@loaded_capacity}"
  end
end
