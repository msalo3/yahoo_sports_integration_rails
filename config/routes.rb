Rails.application.routes.draw do
  resources :properties
  resources :data
  resources :connections

  namespace :credentials do
    scope :oauth do
      get 'authorize/:connection_id', to: 'o_auth#authorize', as: :oauth_authorize
      get 'callback', to: 'o_auth#callback', as: :oauth_callback
      # get 'disconnect/:connection_id', to: 'o_auth#disconnect', as: :oauth_disconnect
    end
  end

  namespace :data_request do
    scope :data_request do
      get 'league_info', to: 'data_request#league_info', as: :request_league_info
    end
  end

  get 'users/new'

  root 'static_pages#home'

  get '/test',    to: 'static_pages#test'

  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  resources :users
end
