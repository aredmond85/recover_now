Rails.application.routes.draw do
  resources :powers
  resources :villains
  resources :heroes
  resources :requesters
  resources :assignees
  resources :reports
  get 'about', to: 'pages#about'

  root 'pages#home'
end
