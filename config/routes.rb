Rails.application.routes.draw do
   get    '/'             ,to: 'sessions#new' ,as: 'home'
   get    '/unpayed'     ,to: 'coffeebins#unpayed' ,as: 'unpayed'
  resources :sessions, only: [:new, :create, :destroy]
  resources :prices, only: [:new, :create]
  resources :users
  resources :coffeebins
end
