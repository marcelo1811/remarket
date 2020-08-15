module Admin
  class ProductsController < AdminController
    before_action :set_product, only: [:edit, :update, :destroy]

    def new
      @product = Product.new
      @product_variants = @product.variants_for_form
    end

    def create
      @product = Product.new(product_params.merge(store: @store))
      @product_variants = @product.variants_for_form(product_params[:variants])

      if @product.valid?
        @product.save!
        redirect_to [:admin]
      else
        render 'new'
      end
    end

    def edit
      @product_variants = @product.variants_for_form
    end

    def update
      @product_variants = @product.variants_for_form(product_params[:variants])

      if @product.update(product_params)
        redirect_to [:admin]
      else
        render 'edit'
      end
    end

    def destroy
      @product.destroy

      redirect_to [:admin]
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :is_active, :photo, variants: [[:name, :price, :id]])
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
