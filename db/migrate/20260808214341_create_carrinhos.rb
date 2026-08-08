class CreateCarrinhos < ActiveRecord::Migration[8.1]
  def change
    create_table :carrinhos do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
