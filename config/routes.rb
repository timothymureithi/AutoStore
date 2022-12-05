Rails.application.routes.draw do
  resources :images
  resources :roles
  resources :order_items
  resources :orders
  resources :cart_products
  resources :carts
  resources :categories
  resources :products
  resources :reviews
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
