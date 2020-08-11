class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :catalogue
  has_one :store

  def slug
    "#{self.first_name} #{self.last_name}".split(' ').join('-').downcase
  end
end
