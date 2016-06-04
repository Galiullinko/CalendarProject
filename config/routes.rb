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
    get '/subscribed_events', to: 'events#subscribed_events'
end
