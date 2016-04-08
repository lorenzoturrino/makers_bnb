feature 'Navbar' do
  scenario 'Sign out' do
    named_signup
    click_button 'Sign out'
    expect(current_path).to eq '/user/new'
    expect(page).not_to have_content('Welcome')
  end

  scenario 'Login' do
    visit '/'
    click_button 'Log in'
    expect(current_path).to eq '/session/new'
    expect(page).to have_content("Log in")
  end

  scenario 'Register' do
    visit '/'
    click_button 'Register'
    expect(current_path).to eq '/user/new'
    expect(page).to have_content("Register")
  end

  scenario 'Create space' do
    named_signup
    click_button 'Create space'
    expect(current_path).to eq '/spaces/new'
    expect(page).to have_content('Add a space')
  end

  scenario 'Check requests' do
    named_signup
    click_button 'Check requests'
    expect(current_path).to eq '/requests'
    expect(page).to have_content 'Requests'
  end

end
