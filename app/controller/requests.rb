class Bnb < Sinatra::Base
  get '/requests' do
    puts @host_requests = Booking.all(host_id: session[:user_id])
    puts @guest_requests = Booking.all(guest_id: session[:user_id])
    erb(:'/requests/index')
  end

  post '/requests' do
    if  params[:confirmed]
      booking = Booking.get(params[:host_request_id])
      booking.status = 'confirmed'
      booking.save

      flash.keep[:notice] = "Space request confirmed :)"
      redirect('/requests')
    else
      booking = Booking.get(params[:host_request_id])
      booking.status = 'declined'
      booking.save
      flash.keep[:notice] = "Space request was declined :("
      redirect('/requests')
    end
  end
end
