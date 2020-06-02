Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard' to: 'pages#dashboard'
  get 'my_bookings' to: 'pages#my_bookings'
  get 'my_listings' to: 'pages#my_listings'
  resources :friends
end
