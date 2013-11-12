DrinkingDash::Application.routes.draw do
  get "payments/new"
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/home', to: 'static_pages#home', via: 'get'
  match '/code', :to => redirect("https://github.com/Egogre/drinking_dash"), via: 'get'
  get "users/new"
  match '/dashboard', to: 'dashboard#index', via: 'get'
  resources :drinks
  resources :categories
  resources :users
  resources :order_items
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders
  resources :payments, expect: [:index]
  root 'static_pages#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
