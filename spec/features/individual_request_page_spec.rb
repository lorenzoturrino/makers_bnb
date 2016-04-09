feature 'Individual request page' do
  let(:guest1) { User.create(name: 'Guest', username: 'Guest123', email: 'guest1@me.com', password: 1234, password_confirmation: 1234) }
  let(:guest2) { User.create(name: 'Guest2', username: 'Guest2123', email: 'guest2@me.com', password: 1234, password_confirmation: 1234) }

  let(:host1) { User.create(name: 'Host1', username: 'Host1', email: 'host1@me.com', password: 1234, password_confirmation: 1234) }
  let(:host2) { User.create(name: 'Host2', username: 'Host2', email: 'host2@me.com', password: 1234, password_confirmation: 1234) }
  let(:host3) { User.create(name: 'Host3', username: 'Host3', email: 'host3@me.com', password: 1234, password_confirmation: 1234) }

  let(:space1) { Space.create(name: 'BigBen', description: 'Big bell in London', price: 250, user: host1, start_availability: '12/04/2016', end_availability: '30/09/2015') }
  let(:space2) { Space.create(name: 'The Rizz', description: 'In paris. La vie!', price: 250, user: host2, start_availability: '12/04/2016', end_availability: '30/09/2015')}

  let!(:booking) { Booking.create(space_id: space1.id, host_id: host1.id, guest_id: guest1.id, status: 'Pending', booking_start: '12/06/2016', booking_end: '16/06/2016', total_price: 250) }
  let!(:booking2) { Booking.create(space_id: space2.id, host_id: host2.id, guest_id: guest1.id, status: 'Pending', booking_start: '12/05/2016', booking_end: '16/05/2016', total_price: 250) }
  let!(:booking3) { Booking.create(space_id: space1.id, host_id: host1.id, guest_id: guest2.id, status: 'Pending', booking_start: '14/07/2016', booking_end: '16/07/2016', total_price: 250) }

  before :each do
    signin('Anne',1234)
    visit 'requests'
  end

  feature 'Host' do
    before :each do
      signin(host1.email,1234)
      visit('requests')
    end

    scenario 'should be able to click request for more detailed information' do
      visit '/requests'
      first('.detailed-view').click
      expect(page).to have_content('Request for \'BigBen\'')
      expect(page).to have_content('From: guest1@me.com')
      expect(page).to have_content('Dates: 12/06/2016 to 16/06/2016')
    end

    scenario 'should include list of other requests for same space' do
      visit '/requests'
      first('.detailed-view').click
      within(:css, '.other-requests') do
        expect(page).not_to have_content('Dates: 12/06/2016 to 16/06/2016')
        expect(page).to have_content('Other Requests for this Space')
        expect(page).to have_content('Pending')
        expect(page).to have_content('Dates: 14/07/2016 to 16/07/2016')
      end
    end

    # scenario 'should be able to confirm or decline a reservation request' do
    #
    # end
  end
end
