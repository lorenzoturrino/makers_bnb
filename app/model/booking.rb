class Booking
  include DataMapper::Resource

  property :id, Serial
  property :space_id, Integer
  property :host_id, Integer
  property :guest_id, Integer
  property :status, String
  property :booking_start, Date
  property :booking_end, Date
  property :total_price, Float

end
