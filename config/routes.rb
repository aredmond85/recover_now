Rails.application.routes.draw do
  resources :heros
  resources :powers
  resources :villains
  resources :requesters
  resources :assignees
  resources :reports
  get 'about', to: 'pages#about'

  root 'pages#home'
end
