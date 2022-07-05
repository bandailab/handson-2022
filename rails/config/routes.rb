Rails.application.routes.draw do
  get 'posts/new'
  get 'users/show'
  root 'static_pages#home'
  get '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup',   to: 'users#new' 
  post '/signup',  to: 'users#create'
  
  resources :users
  resources :posts
  resources :tags
end
