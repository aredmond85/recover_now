Rails.application.routes.draw do
  devise_for :requesters
  resources :heros
  resources :powers
  resources :villains
  resources :assignees
  resources :reports
  get 'about', to: 'pages#about'

  root 'pages#home'
end
