class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text, length: 10000
  property :price, Float
  property :start_availability, Date
  property :end_availability, Date
  property :booked_dates, Text
  
  belongs_to :user
  has n, :bookings

end
