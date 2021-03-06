Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'users#show'

  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  get '/discover', to: 'discover#index'

  resources :movies, only: [:index, :show]
  resources :movie_parties, only: [:new, :create]

  post '/friendship', to: 'friendships#create'
end
