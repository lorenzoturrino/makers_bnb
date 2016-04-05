feature 'Request space' do
  scenario 'A user can click button to be redirect to new booking page' do
    named_signup
    create_a_space
    click_button 'Book now'
    expect(current_path).to eq('/bookings/new')
  end

  scenario 'A user can select a date for a new booking' do
    named_signup
    create_a_space
    click_button 'Book now'
    fill_in :date_requested, with: '01/01/2016'
    click_button 'Submit'
    expect(page).to have_content "Request sent"
  end
end
