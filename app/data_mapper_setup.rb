require 'data_mapper'
require 'dm-postgres-adapter'

database = ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, database)

require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/request'

DataMapper.finalize
DataMapper.auto_upgrade!
