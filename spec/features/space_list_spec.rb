feature 'Display spaces' do
  let(:name){'MY SPACE'}
  let(:description){'description'}
  let(:price){'12.11'}
  let(:date){'2016-05-01'}

  scenario 'shows the name of the space' do
    create_database_space(name,description,price,date)
    named_signup
    visit '/spaces'
    expect(page).to have_content('MY SPACE')
  end

  scenario 'shows the name of the host' do
    create_database_space(name,description,price,date)
    named_signup
    visit '/spaces'
    expect(page).to have_content('town_girl')
  end

end
