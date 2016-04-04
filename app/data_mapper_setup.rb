

require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'server'


DataMapper.setup(:default,  ENV['DATABASE_URL'] || "postgres://localhost/bnb_#{ENV['RACK_ENV']}")
if ENV['RACK_ENV'] == 'test'
   DataMapper.auto_migrate!
end
DataMapper.finalize
