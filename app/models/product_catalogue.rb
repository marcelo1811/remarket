class ProductCatalogue < ApplicationRecord
  attr_accessor :product_variant_id, :quantity

  belongs_to :product
  belongs_to :catalogue

  validates :margin, presence: true

  scope :available_by_provider, -> { includes(:product).where(products: { is_active: true }) }
  scope :without_margin, -> { where(margin: 0) }
  scope :with_margin, -> { where.not(margin: 0) }

  def cheapest_resell_price
    product.cheapest_product_variant.price + margin
  end

  def resell_price(product_variant)
    product_variant.price + margin
  end

  def owner?(user)
    self.catalogue.user == user
  end
end
