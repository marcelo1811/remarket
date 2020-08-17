class StoresController < ApplicationController
  before_action :set_store, only: [:show, :terms]

  def show
    @products = @store.products
  end

  def index
    @stores = Store.all
  end

  def terms; end

  private

  def set_store
    @store = Store.find(params[:id])
  end
end
