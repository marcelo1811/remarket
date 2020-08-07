class Catalogue < ApplicationRecord
  belongs_to :user

  has_many :product_catalogues

  validates :name, presence: true
end
