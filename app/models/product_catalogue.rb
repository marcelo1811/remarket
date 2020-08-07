class ProductCatalogue < ApplicationRecord
  belongs_to :product
  belongs_to :catalogue

  validates :comission, presence: true
end
