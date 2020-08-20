Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }, 
              skip: [:mailer, :unlocks, :passwords, :confirmations]

  resources :reports do
    resources :heros do
      resources :hero_bios
    end
    resources :villains do
      resources :villain_bios
    end 
  end

  resources :heros
  resources :villains
  resources :villain_bios
  resources :hero_bios
  resources :users, except: :new
  get 'about', to: 'pages#about'
  root 'pages#home'
end
