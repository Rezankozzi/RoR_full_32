# frozen_string_literal: true

require_relative './modules/manufacturer'
require_relative './modules/instance_counter'
require_relative './modules/accessors'
require_relative './modules/validation'
require_relative './classes/station'
require_relative './classes/route'
require_relative 'classes/train/train'
require_relative 'classes/train/train_cargo'
require_relative 'classes/train/train_passenger'
require_relative 'classes/wagon/wagon'
require_relative 'classes/wagon/wagon_cargo'
require_relative 'classes/wagon/wagon_passenger'
require_relative 'interfaces/train_interface'
require_relative 'interfaces/station_interface'
require_relative 'interfaces/route_interface'
require_relative 'interfaces/wagon_interface'
require_relative 'interfaces/data_interface'
require_relative './modules/test_module' # подключение тестового модуля
require_relative 'interfaces/interface'

interface = Interface.new
interface.entry
