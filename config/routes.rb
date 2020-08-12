Rails.application.routes.draw do
  resources :categories
  resources :reports
  resources :responders
  resources :users
  get 'about', to: 'pages#about'

  root 'pages#home'
end
