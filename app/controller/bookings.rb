class Bnb < Sinatra::Base

  get '/bookings/new' do
    erb :'bookings/new'
  end

  post '/bookings/new' do
    host_id = Space.get(params[:space_id]).user.id
    guest_id = User.get(session[:user_id]).id
    booking = Booking.create(space_id: params[:space_id],
            host_id: host_id,
            guest_id: guest_id)
    if booking
      session[:booking_id] = booking.id
    end
    redirect 'bookings/new'
  end

  post '/bookings' do
    booking = Booking.get(session[:booking_id])
    booking_price_per_night = Space.get(booking.space_id).price
    date_requested = Date.parse(params[:date_requested])
    booking.update(date_requested: date_requested,
            total_price: booking_price_per_night,
            status: 'pending')
    flash.keep[:notice] = "Request sent"
    redirect '/'
  end
end
