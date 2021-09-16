
class Wagon_interface < Train_interface

  WAGON_INTERFACE = ["\nМеню управления вагонами:",
                     "\nСоздать новый вагон--'create'",
                     "Выйти из меню--'exit'"]

  def initialize
    @wagons = []
    @selected_wagons = []
  end

  def entry
    loop do
      puts  WAGON_INTERFACE
      choice = input_user("Введите название операции:").to_sym
      break if choice == :exit
      send choice
    end
  end

  def create
    wagon_type = input_user("\nВведите тип вагона: пассажирский-'passenger' или  грузовой-'cargo' :").to_sym
    wagon_number = "wg" + rand(100..200).to_s
    @wagons << Wagon.new(wagon_number, wagon_type)
  end

  def select_wagon(type)
    if @wagons.empty? == true
      puts "Список вагонов пуст!"
      create
    end
    wagons_list(type)
    wagon_number = input_user("Введите номер вагона из списка:")
    @wagons.each do |x|
    @selected_wagon = x if x.number == wagon_number
    end
  end

  def wagons_list(type)
    puts "Список имеющихся вагонов:"
    wagons_type = @wagons.select {|wagon| wagon.type == type}
    puts  wagons_type
    wagons_type
  end
  end