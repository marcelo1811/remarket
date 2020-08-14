class CataloguesController < ApplicationController
  before_action :set_store, only: [:subscribe_to_store]
  before_action :set_catalogue, only: [:show]

  def subscribe_to_store
    catalogue = current_user.catalogue

    catalogue.subscribe_to_store(@store)

    redirect_to users_path
  end

  def show
    @product_catalogues = @catalogue.product_catalogues
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_catalogue
    @catalogue = Catalogue.find(params[:id])
  end
end
