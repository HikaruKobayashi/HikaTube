Rails.application.routes.draw do
  root to: 'youtube#index'

  resources :youtube
end
