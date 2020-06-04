Rails.application.routes.draw do
  devise_for :users
  # get 'user_profile/:id', to: 'users#show'
  get 'user_profile/:id/edit', to: 'users#edit', as: :edit_user_profile
  patch 'user_profile/:id', to: 'users#update', as: :user_profile
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'my_bookings', to: 'pages#my_bookings' #Bookings summary page for consumer
  get 'my_listings', to: 'pages#my_listings'

  resources :friends do
    resources :bookings , only: [:create, :new]
    member do
      get :bookings #Bookings summary page for provider
    end
  end

  resources :bookings , only: [:show, :edit, :destroy] do
    resources :reviews ,  only: [:new, :create]
   end


end
