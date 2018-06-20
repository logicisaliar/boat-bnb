Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/become_host", to: "pages#become_host"
  get "/:city", to: "boats#search_by_city", as: "city"

  resources :boats, only: [:index, :show] do
    resources :bookings, only: [:show, :new, :create]
  end

  namespace :host do
    resources :boats
  end
end

