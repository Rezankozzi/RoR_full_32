# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validations
      @validations ||= []
    end

    def validate(name, type, *param)
      validations << { name: name, type: type, param: param }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError => e
      puts e.inspect
      false
    end

    private

    def validate!
      errors = []
      self.class.validations.each do |hash|
        action = "#{hash[:type]}_validate".to_sym
        param = hash[:param] unless hash[:param].nil?
        message = send(action, hash[:name], param)
        errors << message unless message.nil?
      end
      raise errors.join('; ') unless errors.empty?
    end

    def presence_validate(name, _)
      "'#{name}' should be present!" if attr_value(name).nil? || attr_value(name).to_s.empty?
    end

    def format_validate(name, param)
      "'#{name}'has invalid format!" if attr_value(name) !~ param[0]
    end

    def value_validate(name, param)
      "Invalid value of '#{name}'!" unless param[0].include? attr_value(name)
    end

    def equality_validate(name, _)
      return unless attr_value(name)[0].number == attr_value(name)[1].number

      'Not allowed equality fist_station and final_stations!'
    end

    def attr_value(name)
      instance_variable_get("@#{name}")
    end
  end
end
