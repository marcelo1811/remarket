class AdminController < ApplicationController
  before_action :check_permission
  before_action :set_store

  def index
    @products = @store.products
  end

  private

  def set_store
    @store = current_user.store
    redirect_to new_admin_store_path if @store.blank?
  end

  def check_permission
    return redirect_to users_path unless current_user.admin?
  end
end
