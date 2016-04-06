feature 'Request space' do

  before :each do
    host = db_create_user("dude","d@m.com","dude","dude_pass")
    space_one = db_create_space("first house","pretty",10.01,Date.parse("11 may 2016"),host.id)

    visit '/'
    click_button('Register')
    submit_signup_form("guest","guest","g@m.com","guest_pass","guest_pass")
  end

  scenario 'A user can click button to be redirect to new booking page' do
    click_button('Book now')
    expect(current_path).to eq('/bookings/new')
  end

  scenario 'A user can select a date for a new booking' do
    click_button('Book now')
    submit_booking_form("11 may 2016")
    expect(page).to have_content("Request sent")
    expect(current_path).to eq('/spaces')
  end

  scenario 'Request date gets parsed correctly' do
    click_button('Book now')
    submit_booking_form("11 may 2016")
    database_entry = Booking.first
    expect(database_entry.date_requested.to_s).to eq("2016-05-11")
  end

end
