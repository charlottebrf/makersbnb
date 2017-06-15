require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :password_digest, Text
  property :email, String, required: true

  validates_presence_of     :password_confirmation
  validates_presence_of     :password
  validates_length_of       :password, min: 6
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def gather_info_for_bookings
    to_confirm = check_pending_bookings
    bookings = Array.new
    to_confirm.each do |booking|
      booking = { id: booking.id, requester: User.get(booking.user_id), space: Space.get(booking.space_id) }
      bookings << booking
    end
    bookings
  end

  private

  def check_pending_bookings
    to_confirm = Array.new
    bookings = Array.new
    spaces = Space.all(owner: self.id)
    spaces.each do |space|
      bookings << Booking.all(space_id: space.id)
    end
    bookings.each do |sub_array|
      sub_array.each do |booking|
        to_confirm << booking unless booking.approved
      end
    end
    to_confirm
  end

end
