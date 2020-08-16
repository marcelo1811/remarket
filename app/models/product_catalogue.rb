class ProductCatalogue < ApplicationRecord
  belongs_to :product
  belongs_to :catalogue

  validates :margin, presence: true

  scope :is_available_by_provider, -> { includes(:product).where(products: { is_active: true }) }

  def cheapest_resell_price
    product.cheapest_product_variant.price + margin
  end

  def resell_price(product_variant)
    product_variant.price + margin
  end
end
