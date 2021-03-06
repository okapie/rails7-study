Rails.application.routes.draw do
  root 'sessions#new'

  resources :favorites
  # get 'members/index'
  # get 'members/update'
  resources :makers
  resources :stores
  # resources :toys
  resources :toys do
    get :bookmark, on: :member
    get :remove_bookmark, on: :member
  end
  resources :groups

  # Redirect after login gives `member.{user_id}` path. As a solution, false is set to format option.
  resource :member, format: false
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#logout'

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
