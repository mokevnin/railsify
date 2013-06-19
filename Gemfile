ruby '2.0.0'

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc2'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'kaminari'
gem 'validates'
gem 'state_machine'
gem 'russian'
gem 'simple_form', git: 'git@github.com:plataformatec/simple_form.git'
gem 'virtus'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'less-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

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

# Use unicorn as the app server
gem 'unicorn-rails'

group :development do
  gem 'capistrano'
  gem 'sqlite3'
  gem 'quiet_assets'
end

group :test do
  #NOTE for travis-ci
  gem 'rake'
  gem 'coveralls', require: false
end

group :development, :test do
  gem 'minitest'
  gem 'factory_girl_rails'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
