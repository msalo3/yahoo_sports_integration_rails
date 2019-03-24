Rails.application.routes.draw do
  resources :connections

  # namespace :credentials do
  #   scope :oauth do
  #     get 'authorize/:connection_id', to: 'o_auth#authorize', as: :oauth_authorize
  #     get 'callback', to: 'o_auth#callback', as: :oauth_callback
  #     # get 'disconnect/:connection_id', to: 'o_auth#disconnect', as: :oauth_disconnect
  #   end
  # end
  get 'auth/:provider/callback', to: 'sessions#custom'

  get 'users/new'

  root 'static_pages#home'

  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  resources :users
end
