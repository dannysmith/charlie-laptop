require 'serverspec'
require 'yaml'
require 'json'

set :backend, :exec
set :os, :family => 'darwin'

class Config
  @@config = {}

  def self.load(file)
    config = YAML.load_file file
    @@config = JSON.parse(JSON[config], symbolize_names: true)
  end

  def self.method_missing(name, *args, &block)
    if name == :new
      raise NoMethodError, "private method `new' called for #{self}:#{self.class}"
    elsif @@config[name]
      @@config[name]
    else
      raise NoMethodError, "No config matches `#{name}'"
    end
  end

  def self.respond_to_missing?(name, include_private = false)
    !!(@@config[name]) || super
  end
end

Config.load('test_config.yml')
