DrinkingDash::Application.routes.draw do
  get "users/new"
  resources :drinks
  resources :categories
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'categories#index'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
