Rails.application.routes.draw do
  resources :profiles, only: [:create]
  root 'static#home'
end
