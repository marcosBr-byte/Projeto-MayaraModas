class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :senha

      t.timestamps
    end
    add_index :users, :nome, unique: true
    add_index :users, :email, unique: true
    add_index :users, :senha, unique: true
  end
end
