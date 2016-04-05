feature 'Sign in' do
  scenario 'User can sign in with correct credentials' do
    named_signup
    signin('factory@girl.com', '1234' )
    expect(current_path).to eq '/spaces'
    expect(page).to have_content("Welcome Factory")
  end
end
