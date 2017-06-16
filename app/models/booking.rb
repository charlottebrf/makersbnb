require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id,       Serial
  property :user_id,  Integer
  property :space_id, Integer
  property :status, String, default: 'pending'
end
