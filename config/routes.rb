Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#new', as: 'new_session'

  get 'sellers/:seller_id/products', to: 'products#index', as: 'seller_products'
  get 'sellers/:seller_id/products/:id', to: 'products#show', as: 'seller_product'

  resources :users

  resources :sellers, only: [:new, :show, :index] do
    resources :products, only: [:new, :show, :index]
  end

  resources :buyers

end
