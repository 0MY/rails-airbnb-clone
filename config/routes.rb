Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  resources :woas, only: [:index, :show], path: "oeuvres-art" do
  resources :bookings, only: [:new, :create, :show], path: "reservations"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"

end
