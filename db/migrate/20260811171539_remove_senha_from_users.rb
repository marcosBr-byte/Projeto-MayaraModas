class RemoveSenhaFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :senha, :string
  end
end
