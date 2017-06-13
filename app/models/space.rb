
class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has 1, :user, through: Resource
end
