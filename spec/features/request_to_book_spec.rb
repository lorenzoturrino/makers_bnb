feature 'Request space' do
  let(:host){db_create_user("host","h@m.com","host","host_pass")}
  let!(:space_one){db_create_space("first house","pretty",10.01,Date.parse("11 May 2016"),host.id)}

  before :each do
    visit '/'
    click_button('Register')
    submit_signup_form("guest","guest","g@m.com","guest_pass","guest_pass")
    visit('/spaces')
  end

  scenario 'A user can click button to be redirect to new booking page' do
    click_button('Book now')
    expect(current_path).to eq('/bookings/new')
  end

  scenario 'A user can select a date for a new booking' do
    click_button('Book now')
    fill_in(:date_requested, with: "11 May 2016")
    click_button('Submit')
    expect(page).to have_content("Request sent")
    expect(current_path).to eq('/spaces')
  end

  scenario 'Request date gets parsed correctly' do
    click_button('Book now')
    submit_booking_form("11 May 2016")
    database_entry = Booking.first
    expect(database_entry.date_requested.to_s).to eq("2016-05-11")
  end

end
