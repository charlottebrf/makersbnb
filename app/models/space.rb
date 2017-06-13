require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user.rb'


class Space
  include DataMapper::Resource

  # has 1, :users, {:through=>DataMapper::Resource}

  property :id, Serial
  property :name, String
  # belongs_to :user

end

DataMapper.setup(:default, "postgres://localhost/makersbnb_test")
DataMapper.finalize
DataMapper.auto_upgrade!
