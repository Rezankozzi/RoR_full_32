class PassengerWagon < Wagon
  def initialize(number, capacity)
    @type = :passenger
    super
  end

  def take_a_seat
    @unavailable_capacity +=1
  end

  def info
    "Номер: #{@number}  тип: #{@type}" +
      "свободных мест: #{self.available_capacity}  занятых мест: #{@unavailable_capacity}"
  end
end
