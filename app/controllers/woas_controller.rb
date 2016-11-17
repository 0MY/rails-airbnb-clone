class WoasController < ApplicationController
  def index
       #test de présence du :search ou du :category renvoyé par la page home
       if params[:search]
        # filtre par ville et dates compatibles
        @woas = Woa.where(city: params[:search][:location])
        @woas.select { | w | can_book?(w, params[:search][:book_start], params[:search][:book_end]) }
      elsif params[:category]
        @woas = Woa.where(category: params[:category])
      else
        @woas = Woa.all
      end
  end

  def show
    @woa = Woa.find(params[:id])
    sum = 0
    @woa.bookings.each { | b | sum += b.owner_rating }
    @mean_rating = (sum / @woa.bookings.count).floor
    @booking = Booking.new
  end

  # start_book MUST be < end_book else algo won't work
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






