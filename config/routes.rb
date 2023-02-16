Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'
  get '/me', to: 'users#show'
end
