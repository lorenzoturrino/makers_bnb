feature 'Add space form:' do
  let(:name){'first house'}
  let(:description){'pretty'}
  let(:price){'10.01'}
  let(:start_date){'2016-05-11'}
  let(:end_date){'2016-06-05'}

  before :each do
    visit '/'
    submit_signup_form("host","host","h@m.com","host_pass","host_pass")
    visit('/spaces')
  end


  scenario 'new space gets listed in the space page' do
    click_button 'List a space'
    fill_in :space_name, with: name
    fill_in :space_description, with: description
    fill_in :space_price, with: price
    fill_in :start_availability, with: start_date
    fill_in :end_availability, with: end_date
    click_button 'Submit'

    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(price)
    expect(page).to have_content(start_date)
    expect(page).to have_content(end_date)
    expect(current_path).to eq '/spaces'
  end


end
