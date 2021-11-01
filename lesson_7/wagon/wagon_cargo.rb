class CargoWagon < Wagon
  attr_writer :unavailable_capacity
  def initialize(number, capacity)
    @type = :cargo
    super
  end

  def info
    "Номер: #{@number}  тип: #{@type}  " +
    "свободный объем: #{self.available_capacity}  занятый объем: #{@unavailable_capacity}"
  end
end