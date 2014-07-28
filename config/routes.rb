Rails.application.routes.draw do
  resources :posts

  get 'welcome/index'

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
