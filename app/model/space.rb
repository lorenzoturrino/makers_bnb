class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text, length: 10000
  property :price, Float
  property :available_date, Date

  belongs_to :user
end
