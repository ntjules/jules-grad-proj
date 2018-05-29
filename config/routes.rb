Rails.application.routes.draw do
   get    '/'             ,to: 'sessions#new' ,as: 'home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :prices, only: [:new, :create]
  resources :users
  resources :coffeebins
end
