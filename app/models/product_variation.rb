class ProductVariation < ApplicationRecord
  belongs_to :product
  belongs_to :variation
end
