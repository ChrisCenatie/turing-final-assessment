Rails.application.routes.draw do
  root "task_lists#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :task_lists, only: [:index, :create, :show, :update, :destroy]
end
