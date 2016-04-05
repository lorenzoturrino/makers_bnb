feature 'Add space' do
  let(:name){'MY SPACE'}
  let(:description){'description'}
  let(:price){'12.11'}
  let(:date){'1 may 2016'}

  before :each do
    named_signup
    visit '/spaces/new'
  end

  scenario 'to table' do
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
