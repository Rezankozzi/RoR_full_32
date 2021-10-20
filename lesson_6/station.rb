class Station
  include InstanceCounter
  include Validation
  attr_reader :trains, :name

  @@stations = []

  NAME_FORMAT = /^[A-Z][a-z]{2,}$/

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def arrival(train)
    @trains << train
  end

  def departure(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select {|train| train.type = type}
  end

  def self.all
    @@stations
  end

  private

  def validate!
    raise "Name has invalid format!"  if @name !~ NAME_FORMAT
  end
end

