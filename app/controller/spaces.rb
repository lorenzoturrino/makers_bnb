class Bnb < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces/new' do
    space = Space.create(name: params[:space_name])
    if space
      redirect to :'/spaces'
    else
      erb :'/spaces/new'
    end
  end
end
