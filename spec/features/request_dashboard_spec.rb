feature 'Request Dashboard' do
  let(:guest) { User.create(name: 'Kyle', username: 'Kyle123', email: 'Kyle@me.com', password: 1234, password_confirmation: 1234) }
  let(:host) { User.create(name: 'Anne', username: 'Anne', email: 'anne@me.com', password: 1234, password_confirmation: 1234) }
  let(:space) { Space.create(name: 'BigBen', description: 'Big bell in London', price: 250, user: host) }
  let(:host2) { User.create(name: 'Not Anne', username: 'Not Anne', email: 'not-anne@me.com', password: 1234, password_confirmation: 1234)}
  let(:space2) { Space.create(name: 'The Rizz', description: 'In paris. La vie!', price: 250, user: host2)}
  let!(:booking) { Booking.create(space_id: space.id, host_id: host.id, guest_id: guest.id, status: 'Pending', date_requested: '12/05/2016', total_price: 250) }
  let!(:booking2) { Booking.create(space_id: space2.id, host_id: host2.id, guest_id: guest.id, status: 'Pending', date_requested: '12/05/2016', total_price: 250) }

  before :each do
    signin('Anne',1234)
    visit 'requests'
  end

  scenario 'User should have a request dashboard' do
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Requests'
  end

  scenario 'User should only see requests for their own spaces' do
    expect(page).to have_content('BigBen')
    expect(page).to have_content('Kyle')
    expect(page).to have_content('Status: Pending')
    expect(page).to have_content('Date requested: 2016-05-12')
    expect(page).not_to have_content('The Rizz')
    expect(page).not_to have_content('In paris. La vie!')
  end

  scenario 'User should receive new request on dashboard' do
    expect(page).to have_content('BigBen')
    expect(page).to have_content('Kyle')
    expect(page).to have_content('Status: Pending')
    expect(page).to have_content('Date requested: 2016-05-12')
  end

  scenario 'User can confirm guest request' do
    expect(page).to have_button 'Confirm'
  end

  scenario 'User sees confirmation after clicking confirm' do
    click_button 'Confirm'
    expect(current_path).to eq '/requests'
    expect(page).to have_content 'Space request confirmed :)'
  end
end
