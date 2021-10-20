class Wagon
  include Manufacturer
  include Validation
  attr_reader :type, :name

  NUMBER_FORMAT =/^WG-\d{3}$/

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  private

  def validate!
  raise "Number has invalid format!"  if @number !~ NUMBER_FORMAT
  raise "Type has invalid format!" if [:cargo, :passenger].include?(@type) == false
  end
end