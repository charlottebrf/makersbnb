require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'space.rb'

class User
  include DataMapper::Resource

  # has n, :spaces, through: Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, required: true
  # has n, :spaces

end

DataMapper.setup(:default, "postgres://localhost/makersbnb_test")
DataMapper.finalize
DataMapper.auto_upgrade!
