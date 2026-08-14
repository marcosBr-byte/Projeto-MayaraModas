class User < ApplicationRecord
  has_secure_password
  validates :nome, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_one :carrinho, dependent: :destroy
end
