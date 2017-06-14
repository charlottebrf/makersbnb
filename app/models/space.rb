
class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :owner, Integer
  property :description, Text
  property :price, Integer

end
