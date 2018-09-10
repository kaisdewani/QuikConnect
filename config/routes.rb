Rails.application.routes.draw do
  post '/messages/email'
  post '/messages/text', to: 'messages#text'
  get '/messages/email'
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'profiles#index'
    end
    unauthenticated :user do
      root 'home#index'
    end
  end

  resource :profiles
  resources :accounts, except: [:show]
  resource :shares, only: [:create, :show]
end
