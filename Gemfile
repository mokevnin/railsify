ruby '2.0.0'

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'kaminari'
gem 'validates'
gem 'state_machine'
gem 'russian'
gem 'simple_form'
gem 'virtus'
gem 'term-ansicolor'
gem 'configus'
gem 'ransack'
gem 'omniauth'
gem 'draper'
gem 'authority'
gem 'foreman'
gem 'ancestry'

gem 'anjlab-bootstrap-rails', '~> 3.0.2.0', :require => 'bootstrap-rails'
gem 'anjlab-widgets'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'haml-rails'
gem 'apipie-rails'
gem 'less-rails'
gem "chosen-rails"
gem 'jquery-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

gem 'active_model_serializers'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

gem 'puma'

group :development do
  gem 'mail_view'
  gem 'capistrano'
  gem 'sqlite3'
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-testunit'
end

group :test do
  #NOTE for travis-ci
  gem 'rake'
  gem 'coveralls', require: false
  gem 'minitest'
  gem 'seedbank'
  gem 'capybara-rails'
  gem 'site_prism'
  gem 'wrong'

  gem 'poltergeist'
  gem 'launchy'
end

group :development, :test do
  gem 'factory_girl_rails'
end
