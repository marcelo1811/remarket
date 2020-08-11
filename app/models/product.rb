class Product < ApplicationRecord
  attr_accessor :price
  
  belongs_to :store

  has_many :product_variants
  has_many :product_catalogues

  validates :name, presence: true
  validates :description, presence: true
end
