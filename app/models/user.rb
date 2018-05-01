class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :lockable

  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address

  validates :email, presence: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :password, confirmation: true

end
