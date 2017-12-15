
Rails.application.routes.draw do

  match '(:anything)' => 'application#nothing', via: [:options]

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root 'static_pages#home'

  get 'ltr/*path', to: 'static_pages#home'

#  get 'sessions/new'

#  get 'users/new'

#  get '/register', to: 'users#new'

  post 'register',  to: 'users#create'

#  get    '/login',   to: 'sessions#new'

  post   '/login',   to: 'sessions#create'

  delete '/logout',  to: 'sessions#destroy'

  get '/notifications/show', to: 'notifications#show'

  post '/notifications/show', to: 'notifications#grab'

#  get '/notification/new', to: 'notifications#new'

  post '/notification/create', to: 'notifications#create'

  post '/notifications/webhookapi', to: 'notifications#zapier_hook'
  

  get 'icons/index'

  get 'icons/new', to: 'icons#new'

  get 'icons/create'

  post 'icons/new', to: 'icons#create'

  resources :users
  resources :notifications, only: [:index, :new, :create, :destroy]
  resources :messages
  resources :icons, only: [:index, :new, :create]
 
end
