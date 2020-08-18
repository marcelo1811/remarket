class StoresController < ApplicationController
  before_action :set_store, only: [:show, :terms]

  def show
    @products = @store.products
  end

  def index
    return
    active_store_ids = Product.where(is_active: true).pluck(:store_id)
    @stores = Store.where(id: active_store_ids)
  end

  def terms; end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
