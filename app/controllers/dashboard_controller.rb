class DashboardController < ApplicationController
  before_action :check_permission

  def index
    @catalogues = Catalogue.includes(:user, :product_catalogues, :catalogue_stores)
    @stores = Store.includes(:user, :products, :catalogue_stores)
  end

  private

  def check_permission
    return redirect_to users_path unless current_user.email == 'admin@admin.com'
  end
end
