Rails.application.routes.draw do

  
  get 'sessions/new'
  get 'users/new'
  post '/signup',  to: 'users#create'
  resources :users
  resources :events
  root 'events#index'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/listEvent',   to: 'events#index'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/newevent',  to: 'events#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
