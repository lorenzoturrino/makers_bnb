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

    scenario 'List a space' do
      named_signup
      click_button('List a space')
      expect(current_path).to eq('/spaces/new')
      expect(page).to have_content('Add a space')
    end

    scenario 'Requests' do
      named_signup
      click_button('Requests')
      expect(current_path).to eq('/requests')
      expect(page).to have_content('Requests')
    end

  feature 'Buttons visibility' do

    scenario 'Register page' do
      visit '/user/new'

      expect(page).not_to have_button('Register')
      expect(page).to have_button('Log in')
      expect(page).not_to have_button('Spaces')
      expect(page).not_to have_button('Requests')
      expect(page).not_to have_button('List a space')
      expect(page).not_to have_button('Sign out')
    end

    scenario 'Login page' do
      visit '/session/new'

      expect(page).to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).not_to have_button('Spaces')
      expect(page).not_to have_button('Requests')
      expect(page).not_to have_button('List a space')
      expect(page).not_to have_button('Sign out')
    end

    scenario 'Spaces page' do
      named_signup
      visit '/spaces'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).not_to have_button('Spaces')
      expect(page).to have_button('Requests')
      expect(page).to have_button('List a space')
      expect(page).to have_button('Sign out')
    end

    scenario 'Requests page' do
      named_signup
      visit '/requests'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).to have_button('Spaces')
      expect(page).not_to have_button('Requests')
      expect(page).not_to have_button('List a space')
      expect(page).to have_button('Sign out')
    end

    scenario 'New space page' do
      named_signup
      visit '/spaces/new'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).to have_button('Spaces')
      expect(page).to have_button('Requests')
      expect(page).not_to have_button('List a space')
      expect(page).to have_button('Sign out')
    end

    scenario 'Request new booking page' do
      host = db_create_user("host","h@m.com","host","host_pass")
      space_one = db_create_space("January house", "pretty", 10.01, Date.parse("01/01/2016"), Date.parse("30/01/2016"), host.id, nil)
      named_signup
      visit '/spaces'
      click_button 'Book now'

      expect(page).not_to have_button('Register')
      expect(page).not_to have_button('Log in')
      expect(page).to have_button('Spaces')
      expect(page).to have_button('Requests')
      expect(page).not_to have_button('List a space')
      expect(page).to have_button('Sign out')
    end

  end

end

end
