Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :friends
  resource :dashboard, only: :show do
    collection do
      get :my_bookings
      get :my_lists
    end
  end
end
