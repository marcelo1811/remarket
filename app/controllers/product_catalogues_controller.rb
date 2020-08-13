class ProductCataloguesController < ApplicationController
  before_action :set_product_catalogue, only: [:edit, :update]
  before_action :set_catalogue, only: [:edit, :update]

  def edit; end

  def update
    if @product_catalogue.update(product_catalogue_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private

  def product_catalogue_params
    params.require(:product_catalogue).permit(:comission, :is_active)
  end

  def set_product_catalogue
    @product_catalogue = ProductCatalogue.find(params[:id])
  end

  def set_catalogue
    @catalogue = Catalogue.find(params[:catalogue_id])
  end
end
