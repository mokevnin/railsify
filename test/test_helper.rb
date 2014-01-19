ENV["RAILS_ENV"] = "test"

require File.expand_path('../../config/environment', __FILE__)

I18n.locale = :ru

require 'rails/test_help'

require 'wrong/adapters/minitest'
Wrong.config.color
# Wrong.config.verbose

require 'mocha/setup'
require 'mocha/api'
require 'sidekiq/testing/inline'

Dir[File.expand_path('../support/*.rb', __FILE__)].each { |f| require f }

require 'capybara/poltergeist'

Capybara.configure do |c|
  c.default_host = "http://lvh.me"
  c.current_driver = :poltergeist # selenium
  c.always_include_port = true
  c.asset_host = "http://lvh.me:3000"
  # c.server_port = 3030
end

FactoryGirl.reload

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  include FactoryGirl::Syntax::Methods
  include Concerns::AuthManagment
  include Wrong

  def http_referer=(url)
    @request.env['HTTP_REFERER'] = url
  end

  def subdomain(slug)
    request.host = "#{slug}.#{request.host}"
  end
end

class ActionDispatch::IntegrationTest
  def subdomain(slug)
    Capybara.app_host = "http://#{slug}.lvh.me"
  end

  setup do
    Capybara.app_host = Capybara.default_host
  end
end

module SitePrism
  class Page
    def wait_for_ajax
      Timeout.timeout(Capybara.default_wait_time) do
        active = page.evaluate_script('jQuery.active') until active == 0
      end
    end
  end
end
