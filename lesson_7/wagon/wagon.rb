class Wagon
  include Manufacturer
  include Validation
  attr_reader :type, :number

  NUMBER_FORMAT =/^WG-\d{3}$/

  def initialize(number,type)
    @number = number
    @type = type
    validate!
  end

  private

  def validate!
    errors = []
    errors << "Number has invalid format!"  if @number !~ NUMBER_FORMAT
    errors << "Type has invalid format!" if TYPE_FORMAT.include?(@type) == false
    raise errors.join(' ') unless errors.empty?
  end
end