Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :accounts, only: [:index, :create, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
