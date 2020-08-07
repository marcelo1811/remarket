class Variation < ApplicationRecord
	has_many :product_variations

  validates :name, presence: true
end
	