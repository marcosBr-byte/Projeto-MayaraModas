class Itemcarrinho < ApplicationRecord
  belongs_to :carrinho
  belongs_to :produto
end
