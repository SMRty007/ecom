Rails.application.routes.draw do
  
  get 'carts/index', to: 'carts#index'
  get 'orders/index', to: 'orders#index'
  get 'orders/show/:id', to: 'orders#show', as: 'order'
  get 'orders/update_order_item', to: 'orders#update_order_item'
  get 'sellers/order_list', to: 'sellers#order_list', as: 'order_list'
  post 'orders/create', to: 'orders#create'
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
      get '/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'
      delete '/remove_from_cart', to: 'products#remove_from_cart', as: 'remove_from_cart'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :order_items, only: [:index, :update]
end