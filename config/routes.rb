Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index] do
  end

  get 'admin', to: 'admin#index', as: :admin
  namespace :admin do
    resources :stores, only: [:new, :create, :edit, :update] do
      resources :products, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  get 'stores/:id/terms', to: 'stores#terms', as: :store_terms
  resources :stores, only: [:show, :index, :terms] do
    resources :products, only: [:show]
    resources :catalogues, only: [:create]
    post 'subscribe_to_store', to: 'catalogues#subscribe_to_store', as: :subscribe_to_store
    post 'unsubscribe_from_store', to: 'catalogues#unsubscribe_from_store', as: :unsubscribe_from_store
  end

  resources :catalogues, only: [:show, :edit, :update, :new, :create] do
    resources :product_catalogues, only: [:edit, :update, :show]
  end
  
  post 'product_catalogues/:id/order_on_whats', to: 'product_catalogues#order_on_whats', as: :order_on_whats
end
