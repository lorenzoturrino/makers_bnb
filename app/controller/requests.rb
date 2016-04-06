class Bnb < Sinatra::Base
  get '/requests' do
    @bookings = Booking.all
    erb :requests
  end
end
