class Station
  attr_reader :trains, :name
  
  def initialize(name)
    @name = name
    @trains = []
    print "Станция <<#{@name}>> создана!\n"
  end

  def arrival(train)
    @trains << train
    train.previous_station.departure(train)
  end

  def departure(train)
    @trains.delete(train)
    train.next_station.departure(train)
  end

  def trains_by_type(type)
    @trains.select {|train| train.type = type}
  end
end

