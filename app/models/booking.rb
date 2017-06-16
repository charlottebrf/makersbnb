require 'data_mapper'
require 'dm-postgres-adapter'

class Booking
  include DataMapper::Resource

  property :id,       Serial
  property :user_id,  Integer
  property :space_id, Integer
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
