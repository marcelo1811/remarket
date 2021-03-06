Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'lojista', to: 'pages#landing_store', as: :landing_store
  get 'invite_reseller', to: 'pages#invite_reseller', as: :invite_reseller

  resources :users, only: [:index]

  get 'admin', to: 'admin#index', as: :admin
  namespace :admin do
    resources :stores, only: [:new, :create, :edit, :update] do
      resources :products, only: [:new, :create, :edit, :update, :destroy]
      get 'resellers', to: 'stores#resellers', as: :resellers
    end
  end

  get 'stores/:id/terms', to: 'stores#terms', as: :store_terms
  resources :stores, only: [:show, :index, :terms] do
    resources :products, only: [:show, :index] do
      get 'sales_page', to: 'products#sales_page', as: :sales_page
    end

    resources :catalogues, only: [:create] do
      post 'subscribe_to_store', to: 'catalogues#subscribe_to_store', as: :subscribe_to_store
      post 'unsubscribe_from_store', to: 'catalogues#unsubscribe_from_store', as: :unsubscribe_from_store
    end
  end

  get 'dashboard', to: 'dashboard#index', as: :dashboard
  namespace :dashboard do
    resources :stores, only: [:show]
    resources :catalogues, only: [:show]
  end

  resources :catalogues, only: [:show, :edit, :update, :new, :create] do
    get 'suppliers', to: 'catalogues#suppliers', as: :suppliers
    resources :product_catalogues, only: [:edit, :update, :show]
  end
  
  post 'product/:id/order_on_whats', to: 'products#order_on_whats', as: :store_order_on_whats
  post 'product_catalogues/:id/order_on_whats', to: 'product_catalogues#order_on_whats', as: :order_on_whats
  post 'product_catalogues/:id/notify_supplier', to: 'product_catalogues#notify_supplier', as: :notify_supplier
end
