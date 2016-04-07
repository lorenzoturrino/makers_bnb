feature 'Space list:' do


    def get_date_range(start_date, end_date )
      (start_date..end_date).map {|date| date}
    end


  before :each do
    host = db_create_user("host","h@m.com","host","host_pass")
    guest = db_create_user("renter","r@m.com","renter","renter_pass")
    space_one = db_create_space("first house", "pretty", 10.01, Date.parse("11 may 2016"), Date.parse("11 august 2016"), host.id, get_date_range(Date.parse('04/06/2016'),Date.parse('07/06/2016')))
    space_two = db_create_space("second house", "nice", 10.01, Date.parse("11 may 2016"), Date.parse("11 august 2016"), host.id, get_date_range(Date.parse('04/06/2016'),Date.parse('07/06/2016')))
    space_three = db_create_space("third house","awesome",10.01,Date.parse("12 may 2016"),Date.parse("11 august 2016"),host.id, get_date_range(Date.parse('04/06/2016'),Date.parse('07/06/2016')))
    db_create_booking(space_one.id,host.id,guest.id,"confirmed",Date.parse("11 may 2016"),Date.parse("13 may 2016"),15.22)

    visit '/'
    click_button('Register')
    submit_signup_form("guest","guest","g@m.com","guest_pass","guest_pass")
    visit('/spaces')
  end

  scenario 'shows all spaces by default' do
    expect(page).to have_content('second house')
    expect(page).to have_content('third house')
    expect(page).to have_content('first house')
  end

  scenario 'shows the name of the hosts along listings' do
    expect(page).to have_content("host")
  end

  scenario 'shows all available spaces for a given date range' do
    submit_filter_form("11 may 2016", "16 may 2016")
    expect(page).to have_content('second house')
    expect(page).not_to have_content('first house')
    expect(page).not_to have_content('third house')
  end

end
