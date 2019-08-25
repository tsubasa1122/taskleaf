Rails.application.routes.draw do
  get 'sessions/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  namespace :admin do
    resources :users
  end
  root to: 'tasks#index'
  resources :tasks
end
