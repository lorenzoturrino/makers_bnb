class Bnb < Sinatra::Base

  get '/' do
    redirect '/spaces' if User.get(session[:user_id])
    redirect '/user/new'
  end

  get '/user/new' do
    @user = User.new
    erb(:'user/new')
  end

  post '/user/new' do
    @user = User.new(name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirm])

    if @user.save
      session[:user_id] = @user.id
      redirect('/spaces')
    else
      flash.now[:errors]=@user.errors.full_messages
      erb(:'user/new')
    end
  end

end
