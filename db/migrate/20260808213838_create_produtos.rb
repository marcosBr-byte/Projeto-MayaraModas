class CreateProdutos < ActiveRecord::Migration[8.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :descricao
      t.decimal :preco, precision: 8, scale: 2
      t.integer :estoque

      t.timestamps
    end
  end
end
