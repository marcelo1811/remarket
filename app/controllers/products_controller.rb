class ProductsController < ApplicationController
  before_action :set_store, only: [:show, :index, :sales_page]
  before_action :set_product, only: [:show, :sales_page, :order_on_whats]
  skip_before_action :authenticate_user!, only: [ :index, :sales_page, :order_on_whats ]

  def show
  end

  def index
    @products = @store.products
  end

  def sales_page
  end

  def order_on_whats
    quantity = params[:product][:quantity]
    variant_id = params[:product][:product_variant_id]
    product_variant = ProductVariant.find(variant_id)
    url = "https://wa.me/#{@product.store.whatsapp_complete}?text=Olá, tenho interesse em #{quantity} unidades de #{@product.name}, #{product_variant.name} -> link #{store_product_sales_page_url(@product.store, @product)}?quantity=#{quantity}%26variant_id=#{variant_id}"
    redirect_to url
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_product
    @product = Product.find_by(id: params[:id]) || Product.find_by(id: params[:product_id])
  end
end
