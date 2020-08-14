class AdminController < ApplicationController
  def index
    redirect_to new_admin_store_path if @store.blank?
    
    @store = current_user.store
    @products = @store.products
  end
end
