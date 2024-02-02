Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :recipes do
        
      end
      resources :searches, only: [:index]
      # resources :backgrounds, only: [:index]

      # post "/customers" => "customers#create"
      # # get "/subscriptions" => "subscriptions#index"
      # post "/subscriptions" => "subscriptions#create"
      # post "/teas" => "teas#create"
      # patch "/subscription_teas" => "teas#sub_change"
    end
  end
end
