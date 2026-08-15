class DropPosts < ActiveRecord::Migration[8.1]
  def change
    drop_table :posts do |t|
      t.string "title"
      t.text "description"
      t.timestamps
    end
  end
end