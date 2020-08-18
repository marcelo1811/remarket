class UsersController < ApplicationController
  def index
    return redirect_to [:admin] if current_user.admin?

    @catalogue = current_user.catalogue

    return redirect_to new_catalogue_path if @catalogue.blank?

    @product_catalogues = @catalogue.product_catalogues.available_by_provider
  end
end
