class Bookeddate
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  property :booking_id, Integer

  has n, :bookings, through: Resource

  def format_date
    self.date.strftime('%d/%m/%Y')
  end
end
