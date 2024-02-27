require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:index, :create]
      resources :searches, only: [:index]
      get "recent_search", to: "searches#recent_search"
    end
  end
  post "/users", to: "users#create"
  post "/users/login", to: "users#login"
  get "/users/logout", to: "users#logout"

  mount Sidekiq::Web => '/sidekiq'
end
