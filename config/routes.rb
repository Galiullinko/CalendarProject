Rails.application.routes.draw do
  resources :events
  resources :pages
  devise_for :users
  resources :users, only: [:show]
  root to: "events#index"
    get '/profile', to: 'users#show'
end
