Rails.application.routes.draw do
  root 'profiles#edit'
  devise_for :users
  resource :profiles
  resources :accounts, except: [:show]
  resource :shares, only: [:create, :show]
end
