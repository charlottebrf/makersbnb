# understands information about short-term rent
class Booking
  include DataMapper::Resource

  property :id,       Serial
  property :user_id,  Integer
  property :space_id, Integer
  property :date_id, Integer
  property :approved, Boolean, default: false
end
