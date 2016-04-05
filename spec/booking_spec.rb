require './app/model/booking.rb'

describe Booking do
  it 'should add a new booking to the booking database' do
    Booking.create(space_id: 1, host_id: 1, guest_id: 2,
            status: 'pending', date_requested: '01/01/2016',
            total_price: 100)
    expect(Booking.first).not_to be(nil)
  end

end
