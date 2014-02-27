# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == configus.basic_auth.username \
  && password == configus.basic_auth.password
end

run Rack::URLMap.new('/' => Rails.application, '/admin/sidekiq' => Sidekiq::Web)

