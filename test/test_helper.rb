ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require File.expand_path('../factories', __FILE__)
require 'rails/test_help'
require "capybara/rails"

class ActiveSupport::TestCase
  include Mocha::API

  def setup
    MongoMapper.database.collections.each(&:remove)
    ActionMailer::Base.deliveries = []
  end

  # Add more helper methods to be used by all tests here...
end

module ActionController
  class IntegrationTest
    include Capybara::DSL
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end

CapybaraDefaults = {
  :server_port => 3008,
  :default_host => 'localhost',
  :app_host => 'http://localhost:3008'
}

Capybara.default_wait_time = 10
Capybara.server_port = CapybaraDefaults[:server_port]
Capybara.default_host = CapybaraDefaults[:default_host]
Capybara.app_host = CapybaraDefaults[:app_host]
