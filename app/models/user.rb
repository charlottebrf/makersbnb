
class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, required: true

  has n, :spaces, through: Resource
end
