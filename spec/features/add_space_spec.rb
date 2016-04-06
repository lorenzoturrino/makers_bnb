feature 'Add space form:' do
  let(:name){'first house'}
  let(:description){'pretty'}
  let(:price){'10.01'}
  let(:date){'11 may 2016'}

  before :each do
    visit '/'
    click_button('Register')
    submit_signup_form("host","host","h@m.com","host_pass","host_pass")
  end

  scenario 'new space gets listed on the main page' do
    click_button 'create_space'
    submit_new_space_form(name,description,price,date)

    expect(page).to have_content(name)
    expect(page).to have_content(description)
    expect(page).to have_content(price)
    expect(page).to have_content("2016-05-11")
    expect(current_path).to eq '/spaces'
  end


end
