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

  get "/libraries", to: "libraries#index", as: "libraries"
  get "/libraries/new", to: "libraries#new", as: "new_library"
  post "/libraries", to: "libraries#create"
  get "/libraries/:id", to: "libraries#show", as: "library"
  delete "/libraries/:id", to: "libraries#destroy", as: "delete_library"
  get "/libraries/:id/edit", to: "libraries#edit", as: "edit_library"
  patch "/libraries/:id", to: "libraries#update"

  get "/users/:user_id/libraries", to: "library_users#index", as: "user_libraries"
  post "/libraries/:library_id/users", to: "library_users#create", as: "library_users"
end
