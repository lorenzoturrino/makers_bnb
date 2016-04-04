feature 'Sessions' do

  feature 'Visiting the landing page' do

    scenario 'A unidentified user should be redirected to the signup page' do
      visit '/'
      expect(current_path).to eq '/user/new'
    end

    scenario 'A returning user should be redirected to the listing page' do
      named_signup
      visit '/'
      expect(current_path).to eq '/spaces'
    end


  end


end
