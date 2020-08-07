class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update]
  
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params.merge(user: current_user))

    if @store.valid?
      @store.save!
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @products = @store.products
  end

  def edit; end

  def update
    if @store.update(store_params)
      redirect_to @store
    else
      render 'edit'
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :description, :terms)
  end

  def set_store
    @store = Store.find(params[:id])
  end
end
