feature 'Space list:' do


    def get_date_range(start_date, end_date )
      (start_date..end_date).map {|date| date}
    end


  before :each do
    host = db_create_user("host","h@m.com","host","host_pass")
    guest = db_create_user("renter","r@m.com","renter","renter_pass")
    space_one = db_create_space("January house", "pretty", 10.01, Date.parse("01/01/2016"), Date.parse("30/01/2016"), host.id, nil)
    space_two = db_create_space("Feburary house", "nice", 10.01, Date.parse("01/02/2016"), Date.parse("28/02/2016"), host.id, nil)
    space_three = db_create_space("March house","awesome",10.01,Date.parse("01/03/2016"),Date.parse("30/03/2016"),host.id, nil)
    space_four = db_create_space("Booked house","This is the booked one",10.01,Date.parse("01/04/2016"),Date.parse("30/04/2016"),host.id, get_date_range(Date.parse('04/06/2016'),Date.parse('07/06/2016')))
    db_create_booking(space_four.id,host.id,guest.id,"confirmed",Date.parse("05/04/2016"),Date.parse("13/04/2016"),15.22)

    visit '/'
    submit_signup_form("guest","guest","g@m.com","guest_pass","guest_pass")
    visit('/spaces')
  end

  scenario 'shows all spaces by default' do
    expect(page).to have_content('January house')
    expect(page).to have_content('Feburary house')
    expect(page).to have_content('March house')
    expect(page).to have_content('Booked house')
  end

  scenario 'shows the name of the hosts along listings' do
    expect(page).to have_content("host")
  end

  scenario 'filters the visible spaces by available date' do
    submit_filter_form("11/02/2016", "16/02/2016")
    expect(page).not_to have_content('January house')
    expect(page).to have_content('Feburary house')
    expect(page).not_to have_content('March house')
    expect(page).not_to have_content('Booked house')
  end

  scenario 'filters visible spaces by booked dates' do
    submit_filter_form("11/04/2016", "16/04/2016")
    expect(page).not_to have_content('January house')
    expect(page).not_to have_content('Feburary house')
    expect(page).not_to have_content('March house')
    expect(page).not_to have_content('Booked house')
  end
end
