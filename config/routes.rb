Rails.application.routes.draw do
  root 'profiles#edit'
  post '/messages/text', to: 'messages#text'
  devise_for :users
  resource :profiles
  resources :accounts
  resources :messages, only: [:create, :index, :new]

end
