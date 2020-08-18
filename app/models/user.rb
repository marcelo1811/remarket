class User < ApplicationRecord
  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attr_accessor :invite_code

  has_one :catalogue
  has_one :store

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :check_invite_code

  def slug
    "#{self.first_name} #{self.last_name}".split(' ').join('-').downcase
  end

  private

  def check_invite_code
    update(admin: true) if invite_code == 'admin'
  end
end
