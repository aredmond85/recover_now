Rails.application.routes.draw do
  resources :category
  resources :report
  resources :responder
  resources :user
  get 'about', to: 'pages#about'

  root 'pages#home'
end
