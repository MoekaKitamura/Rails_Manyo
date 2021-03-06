Rails.application.routes.draw do
  resources :labels, except: [:show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root "tasks#index"
  resources :tasks
  namespace :admin do
    resources :users
  end
end
