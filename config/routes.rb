Rails.application.routes.draw do
  devise_for :users
  resource :profiles
  resources :accounts, only: [:index, :create, :destroy]
  root 'profiles#edit'
end
