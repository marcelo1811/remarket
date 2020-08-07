class Store < ApplicationRecord
  belongs_to :user

  has_many :products

  validates :name, presence: true
  validates :description, presence: true
  validates :terms, presence: true
end
