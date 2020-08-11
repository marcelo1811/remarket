class ProductVariant < ApplicationRecord
  belongs_to :product
  belongs_to :variant

  validates :type, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
