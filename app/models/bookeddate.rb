# understands requested booking periods
class Bookeddate
  include DataMapper::Resource

  property :id, Serial
  property :date, Date

  def format_date
    date.strftime('%d/%m/%Y')
  end
end
