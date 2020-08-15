class UsersController < ApplicationController
  def index
    if current_user.admin?
      return redirect_to [:admin]
    end

    @catalogue = current_user.catalogue || Catalogue.create_default(current_user)
    @catalogue_products = @catalogue.product_catalogues
  end
end
