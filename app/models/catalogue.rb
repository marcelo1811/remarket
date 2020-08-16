class Catalogue < ApplicationRecord
  belongs_to :user

  has_many :product_catalogues

  validates :name, presence: true

  def subscribe_to_store(store)
    store.products.each do |product|
      ProductCatalogue.create!(
        product: product,
        catalogue: self,
        margin: 0,
        is_active: false
      )
    end
  end

  def unsubscribe_from_store(store)
    ProductCatalogue.includes(:product).where(products: { store: store }).destroy_all
  end

  def self.create_default(user)
    Catalogue.create!(user: user, name: user.slug)
  end
end
