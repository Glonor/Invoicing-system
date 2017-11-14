Rails.application.routes.draw do
  root 'users#new'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :events
  resources :clients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
