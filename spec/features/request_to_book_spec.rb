feature 'Request space' do

  def get_date_range(start_date, end_date )
      (start_date..end_date).map {|date| date}
    end


  let(:host){db_create_user("host","h@m.com","host","host_pass")}
  let!(:space_one){db_create_space("first house", "pretty", 10.01, Date.parse("11 may 2016"), Date.parse("11 august 2016"), host.id, get_date_range(Date.parse('04/06/2016'),Date.parse('07/06/2016')))}

  before :each do
    visit '/'
    submit_signup_form("guest","guest","g@m.com","guest_pass","guest_pass")
    visit('/spaces')
  end

  scenario 'A user can click button to be redirect to new booking page' do
    click_button('Book now')
    expect(current_path).to eq('/bookings/new')
  end

  scenario 'A user can select a date for a new booking' do
    click_button('Book now')
    find(:xpath, "//input[@id='booking_start']").set "11 May 2016"
    find(:xpath, "//input[@id='booking_end']").set "12 May 2016"
    click_button('Submit')
    expect(page).to have_content("Request sent")
    expect(current_path).to eq('/spaces')
  end

  scenario 'Request date gets parsed correctly' do
    click_button('Book now')
    find(:xpath, "//input[@id='booking_start']").set "11 May 2016"
    find(:xpath, "//input[@id='booking_end']").set "12 May 2016"
    click_button "Submit Request"
    database_entry = Booking.first
    expect(database_entry.booking_start.to_s).to eq("2016-05-11")
    expect(database_entry.booking_end.to_s).to eq("2016-05-12")
  end

end
