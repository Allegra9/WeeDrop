Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#new', as: 'new_session'

  resources :sessions, only: [:create, :destroy]

  resources :users, only: :create

  resources :buyers, only: [:new, :show, :edit, :update, :destroy]

  # get 'sellers/:seller_id/products', to: 'products#index', as: 'seller_products'
  # get 'sellers/:seller_id/products/:id', to: 'products#show', as: 'seller_product'
  # get 'sellers/:id', to: 'sellers#show'
  resources :sellers, only: [:new, :show, :index, :edit, :update] do
    resources :products, only: [:new, :show, :index, :edit, :update, :destroy]
    post '/products/:id/add', to: 'products#add', as: 'add_product'
    get '/products/:id/remove/:buyer_id', to: 'products#remove', as: 'remove_product'
  end

  resources :sales



end
