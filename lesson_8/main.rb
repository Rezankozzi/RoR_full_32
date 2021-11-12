# frozen_string_literal: true

require_relative './modules/manufacturer'
require_relative './modules/instance_counter'
require_relative './modules/validation'
require_relative './station'
require_relative './route'
require_relative './train/train'
require_relative './train/train_cargo'
require_relative './train/train_passenger'
require_relative './wagon/wagon'
require_relative './wagon/wagon_cargo'
require_relative './wagon/wagon_passenger'
require_relative './modules/interfaces/train_interface'
require_relative './modules/interfaces/station_interface'
require_relative './modules/interfaces/route_interface'
require_relative './modules/interfaces/wagon_interface'
require_relative './modules/interfaces/menu_interface'
# require_relative "./modules/test_method.rb" # подключение тестового метода для создания и связывания между собой
# нескольких тестовых объектов.
require_relative './interface'

interface = Interface.new
# interface.test_method #  вызов тестового метода
interface.entry
