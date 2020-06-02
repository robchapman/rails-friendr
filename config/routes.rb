Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard'
  get 'my_bookings', to: 'pages#my_bookings' #Bookings summary page for consumer
  get 'my_listings', to: 'pages#my_listings'
  get 'my_profile', to: 'pages#my_profile'
  resources :friends do
    resources :bookings , only: [:create]
    member do
      get :bookings #Bookings summary page for provider
    end
  end

    #ADD DELETE AND EDIT BOOKING LATER
end
