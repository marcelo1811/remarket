Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index] do
  end

  get 'admin', to: 'admin#index', as: :admin
  namespace :admin do
    resources :stores, only: [:new, :create, :show, :edit, :update] do
      resources :products, only: [:new, :create, :show, :edit, :update, :destroy]
    end
  end

  get 'stores/:id/terms', to: 'stores#terms', as: :store_terms
  resources :stores, only: [:show, :index, :terms] do
    resources :products, only: [:show]
    resources :catalogues, only: [:create]
    post 'subscribe_to_store', to: 'catalogues#subscribe_to_store', as: :subscribe_to_store
  end
end
