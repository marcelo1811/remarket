class CataloguesController < ApplicationController
  before_action :set_store, only: [:subscribe_to_store]

  def subscribe_to_store
    catalogue = current_user.catalogue

    catalogue.subscribe_to_store(@store)

    redirect_to users_path
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end
end
