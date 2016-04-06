feature 'Main page:' do

  before :each do
    host = db_create_user("dude","d@m.com","dude","dude_pass")
    guest = db_create_user("bro","b@m.com","bro","bro_pass")
    space_one = db_create_space("first house","pretty",10.01,Date.parse("11 may 2016"),host.id)
    space_two = db_create_space("second house","nice",10.01,Date.parse("11 may 2016"),host.id)
    space_three = db_create_space("third house","awesome",10.01,Date.parse("12 may 2016"),host.id)
    db_create_booking(space_one.id,host.id,guest.id,"confirmed",Date.parse("11 may 2016"),15.22)

    visit '/'
    click_button('Register')
    submit_signup_form("guest","guest","g@m.com","guest_pass","guest_pass")
  end

  scenario 'shows all non booked spaces by default' do
    expect(page).to have_content('second house')
    expect(page).to have_content('third house')
    expect(page).not_to have_content('first house')
  end

  scenario 'shows the name of the hosts along listings' do
    expect(page).to have_content("dude")
  end

  scenario 'shows all available spaces on a given day' do
    submit_filter_form("11 may 2016")
    expect(page).to have_content('second house')
    expect(page).not_to have_content('first house')
    expect(page).not_to have_content('third house')
  end

end
