# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*attr)
    attr.each do |name|
      define_method("#{name}_history") { instance_variable_get("@#{name}") }
      define_method(name) { instance_variable_get("@#{name}").last }
      define_method("#{name}=") do |vol|
        instance_variable_set("@#{name}", []) if instance_variable_get("@#{name}").nil?
        instance_variable_get("@#{name}") << vol
      end
    end
  end

  def strong_attr_accessor(attr, klass)
    define_method(attr) { instance_variable_get("@#{attr}") }
    define_method("#{attr}=") do |vol|
      instance_variable_set("@#{attr}", klass) if instance_variable_get("@#{attr}").nil?
      vol.class != klass ? (raise "Invalid type of argument:'#{vol}'!") : instance_variable_set("@#{attr}", vol)
    end
  end
end
