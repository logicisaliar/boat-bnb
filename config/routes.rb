Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boats, only: [:index, :show] do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :host do
    resources :boats do
      resources :bookings
    end
  end
end
