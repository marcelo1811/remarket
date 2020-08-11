class Variant < ApplicationRecord
	has_many :product_variants

  validates :name, presence: true
end
	