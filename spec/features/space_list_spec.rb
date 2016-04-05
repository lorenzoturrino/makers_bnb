feature 'Display spaces' do

  scenario 'shows the name of the space' do
    named_signup
    visit '/spaces/new'
    fill_in :space_name, with: 'MY SPACE'
    click_button 'Submit'
    expect(page).to have_content('MY SPACE')
  end

  scenario ' shows the name of the host' do
    named_signup
    visit '/spaces/new'
    fill_in :space_name, with: 'MY SPACE'
    click_button 'Submit'
    expect(page).to have_content('factory_girl')
  end

end