class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text, length: 10000
  property :price, Float
  property :available_date, Date
  property :start_availability, Date
  property :end_availability, Date
  belongs_to :user
  has n, :bookings

end
