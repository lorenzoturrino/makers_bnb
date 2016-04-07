feature 'Request Dashboard' do
  let(:guest) { User.create(name: 'Kyle', username: 'Kyle123', email: 'Kyle@me.com', password: 1234, password_confirmation: 1234) }

  let(:host) { User.create(name: 'Anne', username: 'Anne', email: 'anne@me.com', password: 1234, password_confirmation: 1234) }
  let(:host2) { User.create(name: 'Not Anne', username: 'Not Anne', email: 'not-anne@me.com', password: 1234, password_confirmation: 1234)}

  let(:space) { Space.create(name: 'BigBen', description: 'Big bell in London', price: 250, user: host , booked_dates: nil) }
  let(:space2) { Space.create(name: 'The Rizz', description: 'In paris. La vie!', price: 250, user: host2, booked_dates: nil)}

  let!(:booking) { Booking.create(space_id: space.id, host_id: host.id, guest_id: guest.id, status: 'Pending', booking_start: '12/05/2016', booking_end: '13/05/2016', total_price: 250) }
  let!(:booking2) { Booking.create(space_id: space2.id, host_id: host2.id, guest_id: guest.id, status: 'Pending', booking_start: '12/05/2016', booking_end: '13/05/2016', total_price: 250) }

  before :each do
    signin('Anne',1234)
    visit 'requests'
  end

  feature 'Host' do
    scenario 'should have a request dashboard' do
      expect(page.status_code).to eq 200
      expect(page).to have_content 'Requests'
    end

    scenario 'should only see requests for their own spaces' do
      expect(page).to have_content('BigBen')
      expect(page).to have_content('Kyle')
      expect(page).to have_content('Status: Pending')
      expect(page).to have_content('Requested from: 2016-05-12')
      expect(page).to have_content('until 2016-05-13')
      expect(page).not_to have_content('The Rizz')
      expect(page).not_to have_content('In paris. La vie!')
    end

    scenario 'should receive new request on dashboard' do
      expect(page).to have_content('BigBen')
      expect(page).to have_content('Kyle')
      expect(page).to have_content('Status: Pending')
      expect(page).to have_content('Requested from: 2016-05-12')
      expect(page).to have_content('until 2016-05-13')
    end

    scenario 'can confirm guest request' do
      expect(page).to have_button 'Confirm'
    end

    scenario 'sees a confirmation flash after clicking confirm' do
      click_button 'Confirm'
      expect(current_path).to eq '/requests'
      expect(page).to have_content 'Space request confirmed :)'
    end    

    scenario 'changes status of booking request from pending to confirmed' do
      click_button 'Confirm'
      expect(page).to have_content 'Status: Confirmed'
      expect(page).not_to have_content 'Status: Pending'
    end

    scenario 'should not see confirm or decline button once booking status is confirmed' do
      click_button 'Confirm'
      expect(page).not_to have_button 'Confirm'
    end

    scenario 'can decline a guest request' do
      expect(page).to have_button 'Decline'
    end

    scenario 'sees a declined flash after clicking decline' do
      click_button 'Decline'
      expect(current_path).to eq '/requests'
      expect(page).to have_content 'Space request was declined :('
    end

    scenario 'changes status of booking request from pending to declined' do
      click_button 'Decline'
      expect(page).to have_content 'Status: Declined'
      expect(page).not_to have_content 'Status: Pending'
    end

    scenario 'should not see confirm or decline button once booking status is confirmed' do
      click_button 'Decline'
      expect(page).not_to have_button 'Decline'
    end
  end
end
