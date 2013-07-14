ENV["RAILS_ENV"] ||= "test"

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!('rails')
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'wrong/adapters/minitest'

require 'capybara/rails'

Dir[File.expand_path('../support/sections/*.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
  include AuthHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end
