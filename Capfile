# Load DSL and Setup Up Stages
load 'deploy'

require 'bundler/capistrano'
require 'rvm/capistrano'
require 'puma/capistrano'
require "whenever/capistrano"
load 'deploy/assets'
load 'config/deploy'

require 'sidekiq/capistrano'
require 'rollbar/capistrano'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
