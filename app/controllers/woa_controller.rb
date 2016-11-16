class WoaController < ApplicationController
    before_action :find_woa, only: [:show]

  def show
    @woa = Woa.find(params[:id])
    @booking = Booking.new
  end

# private

#   def woa_params
#     params.require(:woa).permit(:title, :description, :location, :price, :rent_start_at, :rent_end_at, :owner_id, :size, :hooked_on_wall, !!!TBcontinued!!!)
#   end

end

