Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/become_host", to: "pages#become_host"
  get "/:city", to: "boats#search_by_city", as: "city"
=begin  resources :boats, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
=end
  resources :bookings, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/host' do
    resources :boats do
      resources :bookings
    end
  end
end
