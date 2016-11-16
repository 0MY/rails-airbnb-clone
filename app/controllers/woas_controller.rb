class WoasController < ApplicationController
  def index

    if params[:search]
      if params[:search][:date]
        @woas = Woa.where(date: params[:search][:date])  #résultats filtrés par le form cherch ou les categories de la page home
      elsif params[:search][:category]
        @woas = Woa.where(category: params[:search][:category])
        # @woas = Woa.where(category: "paint")
      end
    else
      @woas = Woa.all
    end
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


