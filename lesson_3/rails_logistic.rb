class  Station
       attr_reader :trains, :name_st      #  Возвращает  список всех поездов (:trains) и название станции (:name_st)                                                          

    def initialize(name)
        @name_st = name	         # Имя станции,  указывается при ее создании
        @trains = {}                 # Список всех поездов, находящихся в текущий момент на станции  
    end   

    def arrival(train)                    # Принимает поезд, и заносит его в список поездов, находящихся на станции
        @trains[train.id] = train.type
    end 
          
    def departure(train)       # Отправляет  поезд (поезд удаляется из списка поездов, находящихся на станции)
        @trains.delete(train.id)    
    end 

    def passenger_trains
    	return @trains.select {|k,v| v = :pass}  #    Возвращает  список  только пассажирских поездов
    end

    def freigth_trains
    	return  @trains.select {|k,v| v = :freigth}  #    Возвращает  список  только грузовых поездов
    end

end


class  Route               

	def initialize(begin_st, final_st)

	   	@begin_st = begin_st      #  Начальная  станция 
	   	@final_st = final_st      #  Конечная станции 
        @intermediates_st = []    #  Cписок промежуточных станций
        @stations = []            # Список всех станций от начальной до конечной  
    end

    def add_st(station)
        @intermediates_st << station.name_st      #  Добавление  промежуточной  станции в список       	                                           
    end	
        
    def delete_st(station)
        @intermediates_st.delete(station.name_st)      # Удаляет промежуточную станцию из списка
    end

    def print_st      #  Выводит список всех стонций от начальной до конечной
        puts  @stations.to_s
    end      
              
    def stations
        @stations <<  @begin_st << @intermediates_st << @final_st # составляет и возвращает  список всех станций от начальной до конечной
        return @stations
    end 

end


class  Train
       attr_accessor :speed  # изменяет  скорость до указанного значения;  возвращает  текущее значение скорости.  
       attr_reader  :wagons, :current_st, :id, :type    # Возвращает количество вагонов (@wagons), текующу станцию нахождения (@current_st)
                                                         # учетный номер (@id) и тип поезда (@type)
    def initialize(id, type, wagons)
        @id = id                     #  Учетный номер поезда, указывается при создании экземпляра класса
        @type = type                 #  Тип  поезда, может принимать значение  :frigth(грузовой) или :pass(пассажирский) 
        @wagons = wagons             #  Количество вагонов  
        @speed = 0
        @names_st = []               
        @current_st = nil
    end        

    def stop       #  торможение (снижение скорости до нуля)
        @speed  = 0        	  
    end 
    
    def next_st    # возвращает  следующую станцию относительно текущей
    	return  @names_st.index(@current_st) + 1    
    end

    def previous_st  #  возвращает предыдущую станцию относительно текущей
        return  @names_st.index(@current_st) - 1
    end         

    def add_route(route)
        @names_st = route.stations      # Принимает маршрут следования из объекта класса Route          
        @current_st = @names_st[0]      # При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
    end    

    def forward                # Перемещение по маршруту на одну станцию вперед
        @current_st = next_st                                     
    end
    
    def back          #  Перемещение по маршруту назад на одну станцию   
        @current_st = previous_st
    end

    def hook_wagon        #  прицепляет один вагон 
    	if  @speed == 0
            then @wagons +=1
            else puts "Прицепить вагон не возможно! Скорость поезда  должна быть равна 0" 
    end

    def unhook_wagon     #   отцепляет один вагон
    	if  @speed == 0
            then @wagons +=1
            else puts "Отцепить  вагон  не возможно! Скорость поезда  должна быть равна 0"
    end

end

























