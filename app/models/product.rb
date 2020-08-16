class Product < ApplicationRecord
  attr_accessor :variants
 
  has_one_attached :photo
 
  belongs_to :store

  has_many :product_variants, dependent: :destroy
  has_many :product_catalogues, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  
  validate :variants_presence

  after_save :create_product_variants
  after_create :create_product_catalogue

  scope :active, -> { where(is_active: true) }

  def variants_for_form(variants=nil)
    # admin/products#create && admin/products#update
    return variants if product_variants.blank? if variants.present?
  
    # admin/products#edit
    return product_variants if product_variants.present?

    # admin/products#new
    [{ name: '', price: '' }]
  end

  def cheapest_product_variant
    product_variants.order(price: :asc).first
  end

  private

  def variants_presence
    variants.each do |variant|
      errors.add(:variant, 'O nome da variação pode estar em branco') if variant[:name].blank?
      errors.add(:variant, 'O preço da variação pode estar ser nulo') if variant[:price].blank?
    end
  end

  def create_product_variants
    delete_ids = product_variants.map(&:id) - variants.map { |item| item[:id].to_i }
    delete_ids.each { |id| ProductVariant.destroy(id) }

    variants.each do |variant|
      next ProductVariant.find(variant[:id]).update(variant) if variant[:id].present?

      ProductVariant.create(
        product: self,
        name: variant[:name],
        price: variant[:price]
      )
    end
  end

  def create_product_catalogue
    catalogue_ids = ProductCatalogue.includes(:product).where(products: { store_id: store.id }).pluck(:catalogue_id)

    catalogue_ids.each do |catalogue_id|
      ProductCatalogue.create!(
        catalogue_id: catalogue_id,
        product: self,
        margin: 0,
        is_active: false
      )
    end
  end
end
