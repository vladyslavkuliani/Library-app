Rails.application.routes.draw do
  root "users#index"

  get "/users", to: "users#index", as:"users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/members", to: "users#show_all", as: "show_users" 

  get "/login", to: "sessions#new", as: "login"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: "logout"
end
