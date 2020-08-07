class Catalogue < ApplicationRecord
  belongs_to :user

  has_many :product_catalogues
end
