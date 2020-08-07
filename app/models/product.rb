class Product < ApplicationRecord
  belongs_to :store

  has_many :product_variations
  has_many :product_catalogues
end
