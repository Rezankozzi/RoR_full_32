class Wagon
  include Manufacturer
  attr_reader :type, :name
  def initialize(name, type)
    InstanceCounter::register_instance
    @name = name
    @type = type
  end
end