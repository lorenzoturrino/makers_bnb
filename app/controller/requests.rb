class Bnb < Sinatra::Base
  get '/requests' do
    @bookings = Booking.all(host_id: session[:user_id])
    erb :requests
  end

  post '/requests' do
    flash.keep[:notice] = "Space request confirmed :)"
    redirect('/requests')
  end
end
