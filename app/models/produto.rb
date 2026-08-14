class Produto < ApplicationRecord
  validates :nome, presence: true
  validates :preco, presence: true, numericality: { greater_than: 0 }
  validates :categoria, presence: true, inclusion: { in: %w[masculino feminino kids] }
  has_many :itemcarrinhos
  has_many :carrinhos, through: :itemcarrinhos
end
