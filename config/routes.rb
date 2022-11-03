require 'sidekiq/web'

Rails.application.routes.draw do
  get 'orders_books/create'
  get 'orders_books/update'
  get 'orders_books/destroy'
  scope '(:locale)', locale: /en|de/ do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users
    # Defines the root path route ("/")
    root 'pages#home'
    get 'pages/home'
    get 'pages/about'
    get 'pages/contact'
    resources :wishlists
    resources :carts
    resources :orders
    resources :books
  end

  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => '/sidekiq'
end
