Rails.application.routes.draw do
  root to: 'youtube#index'

  resources :youtube
  get "/profile" => "youtube#profile"

  post '/callback' => 'line#callback'
end