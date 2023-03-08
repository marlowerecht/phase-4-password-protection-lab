Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  destroy '/logout', to: 'sessions#destroy'
end
