def db_create_user(name,email,username,pass)
  User.create(name: name, email: email, username: username, password: pass, password_confirmation: pass)
end

def db_create_space(name,description,price,start_date, end_date,user_id, dates)
  Space.create(name: name, description: description, price: price, start_availability: start_date, end_availability: end_date, user_id: user_id, booked_dates: dates)
end

def db_create_booking(space_id,host_id,guest_id,status,start_date,end_date,bill)
  Booking.create(space_id: space_id, host_id: host_id, guest_id: guest_id, status: status, booking_start: start_date, booking_end: end_date, total_price: bill)
end


def submit_signup_form(name,username,email,password,password_confirm)
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirm, with: password_confirm
  click_button 'Sign up'
end

def submit_new_space_form(name,description,price, date)
  fill_in :space_name, with: name
  fill_in :space_description, with: description
  fill_in :space_price, with: price
  fill_in :space_availability, with: date
  click_button 'Submit'
end

def submit_booking_form(start_date, end_date)
  fill_in :booking_start, with: start_date
  fill_in :booking_end, with: end_date
  click_button 'Submit'
end

def submit_login_form(email,password)
  fill_in :email , with: email
  fill_in :password , with: password
  click_button 'Sign in'
end

def submit_filter_form(start_date, end_date)
  fill_in :filter_start , with: start_date
  fill_in :filter_end, with: end_date
  click_button 'Filter date'
end



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

def signin(email=nil, password=nil)
  visit('/session/new')
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign in')
end
