feature 'Request Dashboard' do
  scenario 'User should have a request dashboard' do
    visit '/requests'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Requests'
  end

  scenario 'User should receive new request on dashboard' do
    guest = User.create(name: 'Kyle', username: 'Kyle123', email: 'Kyle@me.com', password: 1234, password_confirmation: 1234)
    host = User.create(name: 'Anne', username: 'Anne', email: 'anne@me.com', password: 1234, password_confirmation: 1234)
    space = Space.create(name: 'BigBen', description: 'Big bell in London', price: 250, user: host)
    Booking.create(space_id: space.id, host_id: host.id, guest_id: guest.id, status: 'Pending', date_requested: '12/05/2016', total_price: 250)
    visit 'requests'
    expect(page).to have_content('BigBen')
    expect(page).to have_content('Kyle')
    expect(page).to have_content('Status: Pending')
    expect(page).to have_content('Date requested: 2016-05-12')
  end
end
