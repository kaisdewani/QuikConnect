Rails.application.routes.draw do
  root 'profiles#edit'
  post '/messages/text', to: 'messages#text'
  devise_for :users
  resource :profiles
  resources :accounts, except: [:show]
  resource :shares, only: [:create, :show]
end