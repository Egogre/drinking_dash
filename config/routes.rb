DrinkingDash::Application.routes.draw do
  get "users/new"
  resources :drinks
  resources :categories
  resources :users
  match '/signup', to: 'users#new', via: 'get'
  root 'drinks#index'

end
