Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  get "/merchants", to: "merchants#index"
  get "/merchants/new", to: "merchants#new"
  get "/merchants/:id", to: "merchants#show"
  post "/merchants", to: "merchants#create"
  get "/merchants/:id/edit", to: "merchants#edit"
  patch "/merchants/:id", to: "merchants#update"
  delete "/merchants/:id", to: "merchants#destroy"

  get "/items", to: "items#index"
  get "/items/:id", to: "items#show"
  get "/items/:id/edit", to: "items#edit"
  patch "/items/:id", to: "items#update"
  get "/merchants/:merchant_id/items", to: "items#index"
  get "/merchants/:merchant_id/items/new", to: "items#new"
  post "/merchants/:merchant_id/items", to: "items#create"
  delete "/items/:id", to: "items#destroy"

  get "/items/:item_id/reviews/new", to: "reviews#new"
  post "/items/:item_id/reviews", to: "reviews#create"

  get "/reviews/:id/edit", to: "reviews#edit"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#destroy"

  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#remove_item"
  patch "/cart/:item_id", to: "cart#remove_single_item"
  put "/cart/:item_id", to: "cart#add_single_item"

  get "/orders/new", to: "orders#new"
  post "/orders", to: "orders#create"
  get "/orders/:id", to: "orders#show"
  patch "/orders/:id", to: "orders#update"

  get "/register", to: "users#new"
  post "/users", to: "users#create"
  get "/profile", to: "users#show"
  get "/profile/edit", to: "users#edit"
  patch "/profile", to: "users#update"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get "/dashboard", to: "dashboard#index"
    get "/", to: "dashboard#index"
    get "/users", to: "users#index"
    get "/users/:id", to: "users#show"
    patch "/orders/:id", to: "orders#update"
    get "/merchants", to: "merchants#index"
    patch "/merchants/:merchant_id", to: "merchants#update"
    get "/merchants/:merchant_id", to: "merchants#show"
  end

  namespace :merchant do
    get "/dashboard", to: "dashboard#index"
    get "/", to: "dashboard#index"
    get "/orders/:order_id", to: "orders#show"
    get "/items", to: "items#index"
    match "/items/:item_id/toggle_active", :to => "items#toggle_active", :as => 'merchant_item_active', :via => :patch
    get "/items/new", to: "items#new"
    delete "/items/:item_id", to: "items#destroy"
    post "/items", to: "items#create"
    get "/items/:item_id/edit", to: "items#edit"
    patch "/items/:item_id", to: "items#update"

    #resources :items
  end

  namespace :profile do
    get "/orders", to: "orders#index"
    get "/orders/:order_id", to: "orders#show"
    patch "/orders/:order_id", to: "orders#update"

    patch "/password", to: "passwords#update"
    get "/password/edit", to: "passwords#edit"
  end
end
