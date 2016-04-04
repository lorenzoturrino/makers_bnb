feature 'Add space' do
  scenario 'to table' do
    visit '/spaces/new'
    fill_in :space_name, with: 'MY SPACE'
    click_button 'Submit'
    expect(page).to have_content('MY SPACE')
    expect(current_path).to eq '/spaces'
  end
end
