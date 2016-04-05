class Bnb < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
   
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces/new' do

    

    space = Space.new(name: params[:space_name])
    # if user --> if you want to limit spaces to logged in status
    
    space.user= User.get(session[:user_id])
    space.save
  
     

    if space
      redirect to :'/spaces'
    else
      erb :'/spaces/new'
    end
  end
end
