Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users
  resources :groups
  resources :exchanges
  resources :users

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
  
    unauthenticated do
      root "splash#index", as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
