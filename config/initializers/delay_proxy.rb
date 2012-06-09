class Object
  def delay(options = {})
    if self.is_a?(Class) && instance_variable_get(:@delay_proxy_installed).nil?
      extend ResquePerform
    elsif self.class.instance_variable_get(:@delay_proxy_installed).nil?
      self.class.extend ResquePerform
    end

    DelayProxy.new(self)
  end
end

class DelayProxy
  attr_accessor :target

  def initialize(target_object)
    self.target = target_object
  end

  def method_missing(method, *args, &block)
    if target.respond_to?(:id)
      Resque.enqueue(target.class, {'id' => target.id, 'method' => method, 'args' => args})
    elsif target.is_a?(Class)
      Resque.enqueue(target, {'method' => method, 'args' => args})
    else
      raise "Unsupported function -- not a Class or an object who responds to #id"
    end
  end
end

module ResquePerform
  def self.extended(base)
    return if base.instance_variable_get(:@queue).present?

    base.instance_variable_set(:@delay_proxy_installed, true)
    base.instance_variable_set(:@queue, base.to_s.underscore.downcase)
  end

  def perform(options)
    args = options['args'] || []
    method = options['method'] || 'self'

    if options['id']
      find(options['id']).send(method, *args)
    else
      self.send(method, *args)
    end
  end
end
