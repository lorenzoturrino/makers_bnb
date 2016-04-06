class Bnb < Sinatra::Base
  get '/requests' do
    @host_requests = Booking.all(host_id: session[:user_id])
    erb :requests
  end

  post '/requests' do
    booking = Booking.get(params[:host_request_id])
    booking.status = 'Confirmed'
    booking.save
    flash.keep[:notice] = "Space request confirmed :)"
    redirect('/requests')
  end
end
