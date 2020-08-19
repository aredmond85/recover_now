Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :heros
  resources :reports
  
  get 'about', to: 'pages#about'

  root 'pages#home'
end
