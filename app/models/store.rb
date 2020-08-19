class Store < ApplicationRecord
  belongs_to :user

  has_many :products, dependent: :destroy
  has_many :catalogue_stores, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :terms, presence: true
  validates :whatsapp_number, presence: true
  validates :whatsapp_ddd, presence: true

  def is_subscribed(user)
    catalogue = user.catalogue
    CatalogueStore.find_by(catalogue_id: catalogue.id, store_id: self.id)
  end

  def whatsapp_complete
    '55' + whatsapp_ddd + whatsapp_number
  end

  def whatsapp_beauty
    "(#{whatsapp_ddd}) #{whatsapp_number}"
  end
end
