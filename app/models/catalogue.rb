class Catalogue < ApplicationRecord
  belongs_to :user

  has_many :product_catalogues

  validates :name, presence: true
  validates :whatsapp_number, presence: true
  validates :whatsapp_ddd, presence: true

  def subscribe_to_store(store)
    CatalogueStore.create(store: store, catalogue: self)
  end

  def unsubscribe_from_store(store)
    CatalogueStore.find_by(
      store_id: store.id,
      catalogue_id: self.id
    ).destroy
  end

  def self.create_default(user)
    Catalogue.create!(user: user, name: user.slug)
  end

  def whatsapp_complete
    '55' + whatsapp_ddd + whatsapp_number
  end

  def whatsapp_beauty
    "(#{whatsapp_ddd}) #{whatsapp_number}"
  end
end
