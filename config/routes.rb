Rails.application.routes.draw do
  
  get 'order_items/index'
  get 'carts/index', to: 'carts#index'
  get 'orders/index', to: 'orders#index'
  get 'orders/show/:id', to: 'orders#show', as: 'order'
  get 'carts/place_order', to: 'carts#place_order', as: 'place_order'
  devise_for :users, controllers: {
    registrations: 'customers/registrations'
  }
  
  devise_scope :user do
    root to: "products#index"
  end
  resources :sellers
  resources :customers
  resources :products do
    member do
      post '/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'
      delete '/remove_from_cart', to: 'products#remove_from_cart', as: 'remove_from_cart'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end