class Bnb < Sinatra::Base
  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces/new' do
    space = Space.create(name: params[:space_name])
    p space
    if space
      redirect to :'/spaces/'
    else
      erb :'/spaces/new'
    end
  end
end
