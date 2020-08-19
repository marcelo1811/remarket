class CatalogueStore < ApplicationRecord
  belongs_to :catalogue
  belongs_to :store

  after_create :create_product_catalogues
  after_destroy :destroy_product_catalogues

  private

  def create_product_catalogues
    store.products.each do |product|
      ProductCatalogue.create!(
        product: product,
        catalogue: catalogue,
        margin: 0,
        is_active: false
      )
    end
  end

  def destroy_product_catalogues
    ProductCatalogue.includes(:product).where(catalogue_id: catalogue.id, products: { store_id: store.id }).destroy_all
  end
end
