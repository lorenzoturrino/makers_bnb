class Bnb < Sinatra::Base

  get '/spaces' do

   redirect('/') unless User.get(session[:user_id])
   if params[:filter_date]
    @display_date = Date.parse(params[:filter_date])
  else
    @display_date = nil
  end
    @spaces = Space.all
    @bookings = Booking.all
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    User.get(session[:user_id]) ? erb(:'/spaces/new') : redirect('/')
  end

  post '/spaces/new' do

    availability = Date.parse(params[:space_availability])
    space = Space.new(name: params[:space_name],
      description: params[:space_description],
      price: params[:space_price].to_f.round(2),
      available_date: availability
      )

    space.user = User.get(session[:user_id])

    if space.save
      redirect to :'/spaces'
    else
      erb :'/spaces/new'
    end
  end
end
