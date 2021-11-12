class Station
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^ST\d{2,3}$/.freeze

  @@stations = []

  attr_reader :trains, :number

  def initialize(number)
    @number = number
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def arrival(train)
    trains << train
  end

  def departure(train)
    trains.delete(train)
  end

  def trains_by_type(type)
    trains.select { |train| train.type = type }
  end

  def each_train(&block)
    trains.each(&block)
  end

  def self.all
    @@stations
  end

  private

  def validate!
    raise 'Number has invalid format!' if number !~ NUMBER_FORMAT
  end
end
