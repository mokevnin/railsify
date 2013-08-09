ENV["RAILS_ENV"] ||= "test"

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!('rails')
end

require File.expand_path('../../config/environment', __FILE__)

#TODO нужно только для selenium. Правильно перенести.
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

module SitePrism
  class Page

    def wait_for_ajax
      Timeout.timeout(Capybara.default_wait_time) do
        active = page.evaluate_script('jQuery.active') until active == 0
      end
    end

  end
end

require 'rails/test_help'
require 'wrong/adapters/minitest'

require 'capybara/poltergeist'
require 'capybara/rails'

Capybara.configure do |c|
  #c.javascript_driver = :webkit
  c.current_driver = :poltergeist
end

Dir[File.expand_path('../support/sections/*.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
  include Concerns::AuthManagment

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
