feature 'Request Dashboard' do
  let(:guest1) { User.create(name: 'Guest', username: 'Guest123', email: 'guest1@me.com', password: 1234, password_confirmation: 1234) }
  let(:guest2) { User.create(name: 'Guest2', username: 'Guest2123', email: 'guest2@me.com', password: 1234, password_confirmation: 1234) }

  let(:host1) { User.create(name: 'Host1', username: 'Host1', email: 'host1@me.com', password: 1234, password_confirmation: 1234) }
  let(:host2) { User.create(name: 'Host2', username: 'Host2', email: 'host2@me.com', password: 1234, password_confirmation: 1234) }
  let(:host3) { User.create(name: 'Host3', username: 'Host3', email: 'host3@me.com', password: 1234, password_confirmation: 1234) }

  let(:space1) { Space.create(name: 'BigBen', description: 'Big bell in London', price: 250, user: host1) }
  let(:space2) { Space.create(name: 'The Rizz', description: 'In paris. La vie!', price: 250, user: host2) }

  let!(:booking) { Booking.create(space_id: space1.id, host_id: host1.id, guest_id: guest1.id, status: 'Pending', date_requested: '12/05/2016', total_price: 250) }
  let!(:booking2) { Booking.create(space_id: space2.id, host_id: host2.id, guest_id: guest1.id, status: 'Pending', date_requested: '12/05/2016', total_price: 250) }

  feature 'Host' do
    before :each do
      signin(host1.email,1234)
      visit('requests')
    end

    scenario 'should have a "Requests I\'ve received"' do
      expect(page.status_code).to eq 200
      expect(page).to have_content('Requests I\'ve received')
    end

    scenario 'should only see requests for their own spaces' do
      expect(page).to have_content('BigBen')
      expect(page).to have_content('Guest')
      expect(page).to have_content('Status: Pending')
      expect(page).to have_content('Date requested: 2016-05-12')
      expect(page).not_to have_content('The Rizz')
      expect(page).not_to have_content('In paris. La vie!')
    end

    scenario 'should receive new request on dashboard' do
      expect(page).to have_content('BigBen')
      expect(page).to have_content('Guest')
      expect(page).to have_content('Status: Pending')
      expect(page).to have_content('Date requested: 2016-05-12')
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

    scenario 'should display message if no requests have been received' do
      click_button "Sign out"
      signin(host3.email,1234)
      visit('requests')
      expect(page).to have_content('It seems like you haven\'t received any request yet')
    end
  end

  feature 'Guest' do
    before :each do
      signin(guest1.email,1234)
      visit('requests')
    end

    scenario 'should have a "Requests I\'ve made"' do
      expect(page.status_code).to eq 200
      expect(page).to have_content 'Requests I\'ve made'
    end

    scenario 'should see their own requests' do
      expect(page).to have_content('BigBen')
      expect(page).to have_content('Host1')
      expect(page).to have_content('Status: Pending')
      expect(page).to have_content('Date requested: 2016-05-12')
    end

    scenario 'should display message if no requests have been made' do
      click_button "Sign out"
      signin(guest2.email,1234)
      visit('requests')
      expect(page).to have_content('It seems like you haven\'t made any request yet')
    end

  end
end
