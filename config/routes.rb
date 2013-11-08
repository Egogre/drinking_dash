DrinkingDash::Application.routes.draw do
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  get "users/new"
  resources :drinks
  resources :categories
  resources :users
  resources :order_items
  resources :sessions, only: [:new, :create, :destroy]
  root 'categories#index'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
