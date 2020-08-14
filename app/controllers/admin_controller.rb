class AdminController < ApplicationController
  def index
    @store = current_user.store
    @products = @store.products

    redirect_to new_admin_store_path if @store.blank?
  end
end
