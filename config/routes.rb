Rails.application.routes.draw do
  resources :pages
  resources :categories
  resources :reports
  resources :responders
  resources :users
  get 'about', to: 'pages#about'

  root 'pages#home'
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
