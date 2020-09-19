class Dashboard::CataloguesController < ApplicationController
  before_action :set_catalogue

  def show

  end

  private

  def set_catalogue
    @catalogue = Catalogue.find(params[:id])
  end
end
