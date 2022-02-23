Rails.application.routes.draw do
  resources :makers
  resources :stores
  resources :toys
  resources :groups
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#logout'

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
