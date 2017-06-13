require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user.rb'
require_relative './models/space.rb'

DataMapper.setup(:default, 'postgres://localhost/makersbnb_test')
DataMapper.finalize
DataMapper.auto_upgrade!
