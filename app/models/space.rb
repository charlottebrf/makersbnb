
class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :owner, Serial
  property :description, Text
  property :price, Integer

end
