Rails.application.routes.draw do
  devise_for :users
  resources :groups
  resources :exchanges
  resources :users

  root "groups#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
