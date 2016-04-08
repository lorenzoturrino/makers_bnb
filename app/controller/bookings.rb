class Bnb < Sinatra::Base

  get '/bookings/new' do
    booked_dates = []
    current_space = Space.get(Booking.get(session[:booking_id]).space_id)
    current_space.bookings.each do |booking|
      if booking.booking_start
        booked_dates << get_date_range(booking.booking_start, booking.booking_end)
      end
    end
    booked_dates.flatten
    @booked_dates = booked_dates
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
    start_date = Date.parse(params[:booking_start])
    end_date = Date.parse(params[:booking_end])
    booking.update(booking_start: start_date, booking_end: end_date,
            total_price: booking_price_per_night,
            status: 'pending')

    flash.keep[:notice] = "Request sent"
    redirect '/'
  end
end
