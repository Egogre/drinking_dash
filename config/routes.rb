DrinkingDash::Application.routes.draw do
  get "static_pages/contact"
  get "static_pages/about"
  get "users/new"
  resources :drinks
  resources :categories
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'drinks#index'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
