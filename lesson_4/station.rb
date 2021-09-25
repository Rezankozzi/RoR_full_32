class Station
  attr_reader :trains, :name
  
  def initialize(name)
    @name = name
    @trains = []
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
end

