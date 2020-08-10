Rails.application.routes.draw do
  resources :admins
  resources :responders
  resources :reporters
  resources :tickets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
