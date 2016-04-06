class Bnb < Sinatra::Base

  get '/session/new' do
    erb (:'session/new')
  end

  post '/session/new' do
   user = User.authenticate(params[:email], params[:password])


     if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors]=['Sorry your email or password was incorrect!']
      erb(:'session/new')
    end
  end

  delete '/session' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect('/')
  end
end
