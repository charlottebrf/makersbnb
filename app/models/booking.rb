# understands information about short-term rent
class Booking
  include DataMapper::Resource

  property :id,       Serial
  property :user_id,  Integer
  property :space_id, Integer
  property :date_id, Integer
  property :approved, Boolean, default: false
  property :status, String, default: 'pending'

  def check_status
    case status
    when 'pending'
      return 'is pending approval!'
    when 'approved'
      return 'was approved!'
    when 'denied'
      return 'was denied!'
    else
      raise('MASSIVE ERROR')
    end
  end
end
