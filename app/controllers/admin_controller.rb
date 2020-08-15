class AdminController < ApplicationController
  before_action :validates_admin

  def index
    @products = @store.products
  end

  private

  def validates_admin
    return redirect_to users_path unless current_user.admin?
    
    @store = current_user.store
    return redirect_to new_admin_store_path if @store.blank?
  end
end
