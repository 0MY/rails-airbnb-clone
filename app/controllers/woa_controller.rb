class WoaController < ApplicationController

  def show
    @woa = Woa.find(params[:id])
    @booking = Booking.new
  end

end

