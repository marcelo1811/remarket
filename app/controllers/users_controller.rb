class UsersController < ApplicationController
  def index
    return redirect_to [:admin] if current_user.admin?

    @catalogue = current_user.catalogue || Catalogue.create_default(current_user)
    @product_catalogues = @catalogue.product_catalogues
    @products = @catalogue.product_catalogues
  end
end
