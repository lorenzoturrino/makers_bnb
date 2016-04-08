feature 'Add space form:' do
  let(:name){'first house'}
  let(:description){'pretty'}
  let(:price){'10.01'}
  let(:date){'2016-05-11'}

  before :each do
    visit '/'
    click_button('Register')
    submit_signup_form("host","host","h@m.com","host_pass","host_pass")
    visit('/spaces')
  end

  scenario 'new space gets listed on the main page' do
    click_button 'Create space'
    fill_in :space_name, with: name
    fill_in :space_description, with: description
    fill_in :space_price, with: price
    fill_in :space_availability, with: date
    click_button 'Submit'

    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(price)
    expect(page).to have_content(date)
    expect(current_path).to eq '/spaces'
  end


end
