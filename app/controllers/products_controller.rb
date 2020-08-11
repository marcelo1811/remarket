class ProductsController < ApplicationController
  before_action :set_store, only: [:show]
  before_action :set_product, only: [:show]

  def show
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
