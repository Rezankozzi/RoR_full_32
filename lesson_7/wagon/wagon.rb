class Wagon
  include Manufacturer
  include Validation
  attr_reader :type, :number, :capacity, :loaded_capacity

  NUMBER_FORMAT =/^WG-\d{3}$/

  def initialize(number, capacity)
    @loaded_capacity = 0
    @number = number
    @capacity = capacity
    validate!
  end

  def available_capacity
    @capacity - @loaded_capacity
  end

  private

  attr_writer :loaded_capacity

  def validate!
    errors = []
    errors << "Number has invalid format!"  if @number !~ NUMBER_FORMAT
    errors << "Type has invalid format!" if TYPE_FORMAT.include?(@type) == false
    raise errors.join(' ') unless errors.empty?
  end
end