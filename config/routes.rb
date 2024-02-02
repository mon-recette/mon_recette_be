Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "webscraping", to: "webscraping#webscrape"
  resources :users, only: [:create, :show] do
    member do
      get 'login'
      get 'logout'
    end
  
    collection do
      get 'login_form'
    end
  end
end
