DrinkingDash::Application.routes.draw do
  resources :drinks
  resources :categories
  root 'drinks#index'

end
