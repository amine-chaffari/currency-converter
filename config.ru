# this file is related to the rackup command
# first it loads the whole app
require_relative './config/environment'
if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
  end
use Rack::MethodOverride

run ApplicationController