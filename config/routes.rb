Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard' to: 'pages#dashboard'
  get 'my_friends' to: 'pages#my_bookings'
  get 'my_lists' to: 'pages#my_lists'
  resources :friends
end
