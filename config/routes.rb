Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :profiles
    end
  end
  root 'static#home'
end
