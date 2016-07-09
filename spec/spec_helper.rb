# -*- coding: utf-8 -*-

if ENV['COVERAGE']
  require "simplecov"

  SimpleCov.start :test_frameworks do
    add_filter "/vendor/bundle/"
  end
end

require 'geohex'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path("./support/**/*.rb", File.dirname(__FILE__))].each {|f| require f}

RSpec.configure do |config|
  config.disable_monkey_patching!
end
