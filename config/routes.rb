Rails.application.routes.draw do
  root 'profiles#index'
  post '/messages/email'
  post '/messages/text', to: 'messages#text'
  get '/messages/email'
  devise_for :users
  resource :profiles
  resources :accounts, except: [:show]
  resource :shares, only: [:create, :show]
end
