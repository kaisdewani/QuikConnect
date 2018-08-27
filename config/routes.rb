Rails.application.routes.draw do
  root 'profiles#edit'
  devise_for :users
  resource :profiles
  resources :accounts, only: [:index, :create, :destroy, :new]
end
