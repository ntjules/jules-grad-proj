Rails.application.routes.draw do
   get    '/'             ,to: 'sessions#new' ,as: 'home'
   get    '/unpayed'     ,to: 'coffeebins#unpayed' ,as: 'unpayed'
   get    '/payed'     ,to: 'coffeebins#payed' ,as: 'payed'
   get    '/unpayedforuser'     ,to: 'coffeebins#unpayedforuser' ,as: 'unpayedforuser'
   get    '/payedforuser'     ,to: 'coffeebins#payedforuser' ,as: 'payedforuser'
   get    '/contact_us'     ,to: 'users#contact_us' ,as: 'contact_us'  
   get    '/about_us'     ,to: 'users#about_us' ,as: 'about_us'
   get    '/makeadmin'     ,to: 'users#makeadmin' ,as: 'makeadmin' 
   put    '/updateadmin/:id'         ,to: 'users#updateadmin' ,as: 'updateadmin'
   
  resources :sessions, only: [:new, :create, :destroy]
  resources :prices, only: [:new, :create]
  resources :users
  resources :coffeebins
end
