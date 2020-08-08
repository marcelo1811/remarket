class ProductsController < ApplicationController
  before_action :set_store, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params.merge(store: @store))

    if @product.valid?
      @product.save!
      redirect_to @store
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to [@store, @product]
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy

    redirect_to @store
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :is_active, :price)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
