class Bnb < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  get '/spaces/new' do
    erb :'/spaces/new'
  end

  post '/spaces/new' do
    space = Space.create(name: params[:space_name],
      description: params[:space_description],
      price: params[:space_price].to_f.round(2)
      )
    if space
      redirect to :'/spaces'
    else
      erb :'/spaces/new'
    end
  end
end
