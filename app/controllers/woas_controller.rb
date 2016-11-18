class WoasController < ApplicationController

  def index
    @woas = Woa.where.not(latitude: nil, longitude: nil)

    if params[:search]
      if params[:search][:category]
        @woas = @woas.where(category: params[:search][:category])
      end
      if params[:search][:location]
        @woas = @woas.near(params[:search][:location], 30)  #résultats filtrés par le form cherch ou les categories de la page home
      end
    end

    @hash = Gmaps4rails.build_markers(@woas) do |woa, marker|
      marker.lat woa.latitude
      marker.lng woa.longitude
      # marker.infowindow render_to_string(partial: "/woas/map_box", locals: { woa: woa })
    end
  end

  def show
    @woa = Woa.find(params[:id])
    sum = 0
    @woa.bookings.each { | b | sum += b.owner_rating }
    if @woa.bookings.count = 0
      @mean_rating = 0
    else
      @mean_rating = (sum / @woa.bookings.count).floor
    end
      @booking = Booking.new
  end

  def can_book?(woa, new_start_book, new_end_book)
    if woa.rent_start_at < new_start_book && new_end_book < woa.rent_end_at
      book_flag = false
      woa.bookings.each { | b | b.book_end_at < new_start_book \
                              && b.book_end_at < new_end_book \
                              && new_start_book < b.book_start_at \
                              && new_end_start < b.book_start_at ? book_flag = true : book_flag = false
                        }
      book_flag
    end
  end
end
