# Setting the app envirement
ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

# Add the needed requirement to boot the app
require 'bundler/setup'
require 'rubygems'
require 'bundler'
Bundler.require
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/development.sqlite'
)

# Loading all the files in app folder
require_all 'app'