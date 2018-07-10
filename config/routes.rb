Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'sessions#new', as: 'new_session'
  # get 'sellers/:seller_id/products', to: 'sellers#products', as: 'sellers_products'
  # get 'sellers/:seller_id/products/:id', to: 'sellers#products_show', as: 'products_show'

  resources :users

  resources :sellers, only: [:new, :show, :index] do
    resources :products, only: [:new, :show, :index]
  end

  resources :buyers

end
