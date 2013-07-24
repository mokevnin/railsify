ruby '2.0.0'

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'kaminari'
gem 'validates'
gem 'state_machine'
gem 'russian'
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git'
gem 'virtus'
gem 'term-ansicolor'
gem 'configus'
gem 'ransack', git: 'https://github.com/ernie/ransack.git', branch: 'rails-4'
gem 'omniauth'
gem 'draper'
gem 'authority'
gem 'foreman'
gem 'ancestry'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'less-rails'
gem "chosen-rails"
gem 'compass-rails', github: 'milgner/compass-rails', branch: 'rails4'
gem 'jquery-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem 'active_model_serializers'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
  gem 'yard', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

gem 'puma'

group :development do
  gem 'capistrano'
  gem 'sqlite3'
  #gem 'quiet_assets' #TODO doesn't work
  gem 'guard-minitest'
  gem 'spring'
end

group :test do
  #NOTE for travis-ci
  gem 'rake'
  gem 'coveralls', require: false
  gem 'minitest'
  gem 'seedbank', git: "https://github.com/james2m/seedbank.git"
  gem 'capybara'
  gem 'site_prism'
  gem 'wrong'

  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'launchy'
end

group :development, :test do
  gem 'factory_girl_rails'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
