Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :prices, only: [:new, :create]
  resources :users
  resources :coffeebins
end
