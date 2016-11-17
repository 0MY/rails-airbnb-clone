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
    @booking = Booking.new

  end
end

# simpleform for :search url: woas_path method: get do |f|
#   f.input :date
# end


# link_to woas_path(search: { category: "paint" }) do
#   "la carte de l'appart"
# end


#params = {search: {category: "paint"}}
# ou
#params = {search: {date: DateObject}}
# ou
#params = {}


