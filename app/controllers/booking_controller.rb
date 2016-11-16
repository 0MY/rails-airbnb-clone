class BookingController < ApplicationController
  def new
  end

  def create
    @woa = Woa.find(params[:cocktail_id])
    @booking = @woa.bookings.new(booking_params)

    if @booking.save
      # le flash affichera un bandeau vert et un message de succès.
      flash[:notice] = "Booking from '#{@booking.book_start_at} to '#{@booking.book_end_at} for Work of Art '#{@woa.title}' has been successfully created"
      redirect_to @woa
    else
      # le flash affichera un bandeau rouge et un message d'erreur.
      flash[:alert] = "Booking from '#{@booking.book_start_at} to '#{@booking.book_end_at} has not been created for Work of Art '#{@woa.title}'. Check your inputs and try again."
      # le render fait tourner les validations
      # et affichera les messages d'erreur correspondants
      render 'woa/show'
    end
  end

  def show
  end

private

  def booking_params
    params.require(:booking).permit(:renter_id, :woa_id, :book_start_at, :book_end_at, :validated_at, :paid_at, :owner_rating, :owner_comment, :renter_rating, :renter_comment)
  end
end
