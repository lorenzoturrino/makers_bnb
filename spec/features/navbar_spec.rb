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
end
