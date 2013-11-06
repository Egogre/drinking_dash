DrinkingDash::Application.routes.draw do
  get "users/new"
  resources :drinks
  resources :categories
  root 'drinks#index'

end
