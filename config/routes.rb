Rails.application.routes.draw do
  resources :events
  resources :pages
  devise_for :users
  resources :users, only: [:show]
  root to: "pages#index"
end
