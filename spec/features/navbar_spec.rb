feature 'Navbar' do

  feature 'Buttons functionality' do

    scenario 'Login' do
      visit '/user/new'
      click_button('Log in')
      expect(current_path).to eq('/session/new')
      expect(page).to have_content('Log in')
    end

    scenario 'Register' do
      visit '/session/new'
      click_button('Register')
      expect(current_path).to eq('/user/new')
      expect(page).to have_content('Register')
    end

    scenario 'Sign out' do
      named_signup
      click_button('Sign out')
      expect(current_path).to eq('/user/new')
      expect(page).not_to have_content('Welcome')
    end

    scenario 'Create space' do
      named_signup
      click_button('Create space')
      expect(current_path).to eq('/spaces/new')
      expect(page).to have_content('New space')
    end

    scenario 'Check requests' do
      named_signup
      click_button('Check requests')
      expect(current_path).to eq('/requests')
      expect(page).to have_content('Requests')
    end

    scenario 'Available spaces' do

    end

  end

  feature 'Buttons visibility' do

    scenario 'Register page' do
      visit '/user/new'

      expect(page).not_to have_button('Register')
      expect(page).to have_button('Log in')
      expect(page).not_to have_button('Available spaces')
      expect(page).not_to have_button('Check requests')
      expect(page).not_to have_button('Create space')
      expect(page).not_to have_button('Sign out')
    end

    scenario 'Login page' do
      visit '/session/new'

      expect(page).to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).not_to have_button('Available spaces')
      expect(page).not_to have_button('Check requests')
      expect(page).not_to have_button('Create space')
      expect(page).not_to have_button('Sign out')
    end

    scenario 'Spaces page' do
      named_signup
      visit '/spaces'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).not_to have_button('Available spaces')
      expect(page).to have_button('Check requests')
      expect(page).to have_button('Create space')
      expect(page).to have_button('Sign out')
    end

    scenario 'Requests page' do
      named_signup
      visit '/requests'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).to have_button('Available spaces')
      expect(page).not_to have_button('Check requests')
      expect(page).to have_button('Create space')
      expect(page).to have_button('Sign out')
    end

    scenario 'New space page' do
      named_signup
      visit '/spaces/new'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).to have_button('Available spaces')
      expect(page).to have_button('Check requests')
      expect(page).not_to have_button('Create space')
      expect(page).to have_button('Sign out')
    end

    scenario 'New request page' do
      named_signup
      visit '/bookings/new'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).to have_button('Available spaces')
      expect(page).to have_button('Check requests')
      expect(page).not_to have_button('Create space')
      expect(page).to have_button('Sign out')
    end

  end

end
