class Store < ApplicationRecord
  belongs_to :user

  has_many :products

  validates :name, presence: true
  validates :description, presence: true
  validates :terms, presence: true

  def is_subscribed(user)
    catalogue = user.catalogue
    ProductCatalogue.joins(:product).where(catalogue_id: catalogue.id, products: { store_id: self.id }).present?
  end
end
