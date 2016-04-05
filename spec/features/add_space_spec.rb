feature 'Add space' do
  scenario 'to table' do
    visit('/')
    signup("Factory", "factory_girl", "factory@girl.com",
    "1234", "1234")
    visit '/spaces/new'
    fill_in :space_name, with: 'MY SPACE'
    click_button 'Submit'
    expect(page).to have_content('MY SPACE')
    expect(current_path).to eq '/spaces'
  end
end
