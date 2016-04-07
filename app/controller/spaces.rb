class Bnb < Sinatra::Base

  get '/spaces' do

   redirect('/') unless User.get(session[:user_id])
   if params[:filter_date]
    @filter_date = Date.parse(params[:filter_date])
  else
    @filter_date = nil
  end
    @spaces = Space.all
    @bookings = Booking.all
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    User.get(session[:user_id]) ? erb(:'/spaces/new') : redirect('/')
  end

  post '/spaces/new' do
    start_date = Date.parse(params[:start_availability])
    end_date = Date.parse(params[:end_availability])
    space = Space.new(name: params[:space_name],
      description: params[:space_description],
      price: params[:space_price].to_f.round(2),
      start_availability: start_date,
      end_availability: end_date
      )

    space.user = User.get(session[:user_id])

    if space.save
      redirect to :'/spaces'
    else
      erb :'/spaces/new'
    end
  end
end
