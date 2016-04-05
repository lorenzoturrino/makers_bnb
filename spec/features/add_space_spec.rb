feature 'Add space' do

  before :each do
    named_signup
    visit '/spaces/new'
  end

  scenario 'to table' do
    fill_in :space_name, with: 'MY SPACE'
    fill_in :space_description, with: 'this is a description and also myspace is alive'
    fill_in :space_price, with: "10.22"
    click_button 'Submit'

    expect(page).to have_content('MY SPACE')
    expect(page).to have_content('this is a description')
    expect(page).to have_content('£10.22')
    expect(current_path).to eq '/spaces'
  end


end
