Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "about", to: "about#index"

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :books
        resources :subjects
      end
      resources :wallet
    end
  end
end
