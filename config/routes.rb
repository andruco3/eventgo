Rails.application.routes.draw do

  
  get 'sessions/new'
  get 'users/new'
  post '/signup',  to: 'users#create'
  resources :users
  resources :events
  root 'events#new'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/newevent',  to: 'events#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
