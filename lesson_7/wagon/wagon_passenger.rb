class PassengerWagon < Wagon
  attr_reader :seats, :occupied_seats

  def initialize(number,seats)
    @number = number
    @seats = seats
    @type = :passenger
    @occupied_seats = 0
  end

  def take_a_seat
    @occupied_seats +=1
  end

  def available_seats
    @seats - @occupied_seats
  end

  def info
    "Номер: #{@number}  тип: #{@type} свободных мест: #{available_seats} занятых мест: #{@occupied_seats}"
  end
end
