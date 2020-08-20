Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, 
              skip: [:mailer, :unlocks, :passwords, :confirmations]  
  resources :users, except: :new

  resources :reports do
    resources :heros, only: [:index, :new, :show]
  end
  
  resources :heros
  resources :villains

  
  get 'about', to: 'pages#about'

  root 'pages#home'
end
