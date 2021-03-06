# Based on Ordered List's Harmony config
# Thanks Steve & John :)

module Harmony
  def self.config
    unless @config
      raw_config = File.read(File.join(File.dirname(__FILE__), '..', 'config', 'harmony.yml'))
      config = YAML.load(raw_config)
      config = config[env]
      @config = defined?(HashWithIndifferentAccess) ? HashWithIndifferentAccess.new(config) : config
    end
    @config
  end

  def self.env
    raw_env
  end

  def self.raw_env
    return Rails.env if defined?(Rails)
 
    "development"
  end

  def self.refresh!
    @config = nil
  end

  def self.[](key)
    config[key]
  end

  def self.[]=(key, value)
    @config[key.to_sym] = value
  end
end
