Rails.application.routes.draw do
  # static_pages
  root "static_pages#home"

  # users
  get "/users/login" => "users#login"
  resources :users
end
