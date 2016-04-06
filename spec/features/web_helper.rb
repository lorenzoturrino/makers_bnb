require 'date'

def signup(name=nil, username=nil, email=nil, password=nil, password_confirm = nil)
  visit('/')
  fill_in(:name, with: name)
  fill_in(:username, with: username)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirm, with: password_confirm)
  click_button("Sign up")
end

def named_signup
  signup("Factory", "factory_girl", "factory@girl.com",
  "1234", "1234")
end

def create_a_space
  visit '/spaces/new'
  fill_in :space_name, with: 'MY SPACE'
  fill_in :space_description, with: 'this is a description and also myspace is alive'
  fill_in :space_price, with: "10.22"
  fill_in :space_availability, with: "2016-05-01"
  click_button 'Submit'
end

def signin(email=nil, password=nil)
  visit('/session/new')
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign in')
end

def create_database_space(name,description,price,date)
  newspace = Space.new(name: name, description: description, price: price.to_f, available_date: Date.parse(date))
  named_signup
  newspace.user = User.first
  newspace.save
end
