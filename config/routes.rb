Rails.application.routes.draw do
  # static_pages
  root "static_pages#home"

  # users
  resources :users

  # sessions
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

end
