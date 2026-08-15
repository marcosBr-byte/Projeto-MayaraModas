class AddCategoriaEImagemToProdutos < ActiveRecord::Migration[8.1]
  def change
    add_column :produtos, :categoria, :string
    add_column :produtos, :imagem, :string
  end
end
