module InstanceCounter
  module ClassMethods
    attr_accessor :instance_count

    def instances
      puts @instance_count
      @instance_count
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instance_count ||= 0
      self.class.instance_count += 1
    end
  end

  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
end