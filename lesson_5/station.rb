class Station
  include InstanceCounter
  attr_reader :trains, :name

  @@stations = []
  
  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
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
end

