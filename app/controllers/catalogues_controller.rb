class CataloguesController < ApplicationController
  before_action :set_store, only: [:subscribe_to_store, :unsubscribe_from_store]
  before_action :set_catalogue, only: [:show, :edit, :update, :suppliers]
  skip_before_action :authenticate_user!, only: [ :show ]

  def subscribe_to_store
    catalogue = current_user.catalogue

    catalogue.subscribe_to_store(@store)

    redirect_to users_path
  end

  def unsubscribe_from_store
    catalogue = current_user.catalogue

    catalogue.unsubscribe_from_store(@store)

    redirect_to @store
  end

  def show
    @product_catalogues = @catalogue.product_catalogues.available_by_provider.with_margin
  end

  def new
    @catalogue = Catalogue.new
  end

  def create
    @catalogue = Catalogue.new(catalogue_params.merge(user: current_user))

    if @catalogue.valid?
      @catalogue.save!
      
      store = Store.find_by(id: cookies[:invite_code])
      @catalogue.subscribe_to_store(store) if store.present?
      cookies.delete(:invite_code)
      
      redirect_to :users
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @catalogue.update(catalogue_params)
      redirect_to :users
    else
      render 'edit'
    end
  end

  def suppliers
    store_ids = @catalogue.catalogue_stores.pluck(:store_id)
    @supplier_stores = Store.where(id: store_ids)
  end

  private

  def catalogue_params
    params.require(:catalogue).permit(:name, :whatsapp_number, :whatsapp_ddd)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_catalogue
    @catalogue = current_user.catalogue
  end
end
