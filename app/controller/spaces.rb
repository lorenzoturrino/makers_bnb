class Bnb < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
   
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    if User.get(session[:user_id]) ? erb :'/spaces/new' : redirect('/')
  end

  post '/spaces/new' do
    if User.get(session[:user_id]) ? erb :'/spaces/new' : redirect('/')
      
    space = Space.new(name: params[:space_name])
   
    space.user = User.get(session[:user_id])
    space.save   

    if space
      redirect to :'/spaces'
    else
      erb :'/spaces/new'
    end
  end
end
