class Bnb < Sinatra::Base

  get '/spaces' do

   redirect('/') unless User.get(session[:user_id])

    @spaces = Space.all
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    User.get(session[:user_id]) ? erb(:'/spaces/new') : redirect('/')
  end

  post '/spaces/new' do
    p params[:space_availability]
    p availability = Date.parse(params[:space_availability])

    space = Space.new(name: params[:space_name],
      description: params[:space_description],
      price: params[:space_price].to_f.round(2),
      availability: availability
      )

    space.user = User.get(session[:user_id])

    if space.save
      redirect to :'/spaces'
    else
      erb :'/spaces/new'
    end
  end
end
