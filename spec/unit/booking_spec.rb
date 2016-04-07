describe Booking do

  before :each do
    Booking.create(space_id: 1, host_id: 1, guest_id: 2,
        status: 'pending', booking_start: '25/03/2016', booking_end: '26/03/2016',
        total_price: 100)
  end

  it 'should add a new booking to the booking database' do
    expect(Booking.first).not_to be(nil)
  end

  it 'should have a start and end request date' do
    expect(Booking.first.booking_start).not_to be(nil)
    expect(Booking.first.booking_end).not_to be(nil)
  end
end
