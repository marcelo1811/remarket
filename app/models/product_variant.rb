class ProductVariant < ApplicationRecord
  belongs_to :product

  validates :name, presence: true
  validates :price, presence: true

  def resell_price(product_catalogue)
    price + product_catalogue.margin
  end
end
