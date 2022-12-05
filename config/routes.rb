Rails.application.routes.draw do
  resources :images, only: [:index]
  resources :roles
  resources :order_items
  resources :orders, only: [:index]
  resources :cart_products, only: [:create, :destroy, :destroy_all]
  resources :carts
  resources :categories
  resources :products
  resources :reviews, only: [:index, :create]
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/me", to: "users#show"

  # Defines the root path route ("/")
  # root "articles#index"
end
