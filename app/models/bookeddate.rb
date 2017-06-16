class BookedDate
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  property :booking_id, Integer

  has n, :bookings, :through => Resource

end
