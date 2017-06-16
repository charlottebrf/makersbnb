require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id,       Serial
  property :user_id,  Integer
  property :space_id, Integer
  property :date_id, Integer
  property :approved, Boolean, default: false
  has n, :bookeddates, through: Resource
end
