Rails.application.routes.draw do
  resources :events do
    get 'subscribe'
    get 'unsubscribe'
  end

  devise_for :users
  resources :users, shallow: true do
    resources :events
  end

  root to: "events#index"
    get '/profile', to: 'users#show'
    get '/my_events', to: 'events#my_events'
end
