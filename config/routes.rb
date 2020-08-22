Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, 
              skip: [:mailer, :unlocks, :passwords, :confirmations]

  resources :reports do
    resources :heros, only: [:new, :show, :edit]
    resources :villains, only: [:new, :show, :edit]
  end

  resources :heros
  resources :villains
  resources :villain_bios
  resources :hero_bios
  resources :users, except: :new
  root 'pages#home'
end
