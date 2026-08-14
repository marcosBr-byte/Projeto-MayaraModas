class Carrinho < ApplicationRecord
  belongs_to :user
  has_many :itemcarrinhos, dependent: :destroy
  has_many :produtos, through: :itemcarrinhos
  validates :total, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end