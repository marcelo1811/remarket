class ProductCataloguesController < ApplicationController
  before_action :set_product_catalogue, only: [:edit, :update, :show, :order_on_whats, :notify_supplier]
  before_action :set_catalogue, only: [:edit, :update, :show]
  skip_before_action :authenticate_user!, only: [ :show, :order_on_whats ]

  def edit; end

  def update
    if @product_catalogue.update(product_catalogue_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @variant_options = @product_catalogue.product.product_variants
  end

  def order_on_whats
    quantity = params[:product_catalogue][:quantity]
    product = @product_catalogue.product
    variant_id = params[:product_catalogue][:product_variant_id]
    product_variant = ProductVariant.find(variant_id)
    redirect_to "https://wa.me/#{@product_catalogue.catalogue.whatsapp_complete}?text=Olá, tenho interesse em #{quantity} unidades de #{product.name}, #{product_variant.name} -> link #{catalogue_product_catalogue_url(@product_catalogue.catalogue, @product_catalogue)}?quantity=#{quantity}%26variant_id=#{variant_id}"
  end

  def notify_supplier
    quantity = params[:product_catalogue][:quantity]
    product = @product_catalogue.product
    product_variant = ProductVariant.find(params[:product_catalogue][:product_variant_id])
    redirect_to "https://wa.me/#{@product_catalogue.product.store.whatsapp_complete}?text=Olá, me chamo #{@product_catalogue.catalogue.user.first_name} e sou seu revendedor na Revendy. Tenho um pedido de #{quantity} unidades de #{product.name}, #{product_variant.name} -> link #{catalogue_product_catalogue_url(@product_catalogue.catalogue, @product_catalogue)}"
  end

  private

  def product_catalogue_params
    params.require(:product_catalogue).permit(:margin, :is_active)
  end

  def set_product_catalogue
    @product_catalogue = ProductCatalogue.find(params[:id])
  end

  def set_catalogue
    @catalogue = Catalogue.find(params[:catalogue_id])
  end
end
