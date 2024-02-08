Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index, :create]
      resources :searches, only: [:index]

    end
  end
  post "/users", to: "users#create"
  post "/users/login", to: "users#login"
  get "/users/logout", to: "users#logout"
end
