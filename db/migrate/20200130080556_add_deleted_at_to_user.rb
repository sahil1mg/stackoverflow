class AddDeletedAtToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :deleted_at, :timestamp
    add_index :users, [:email_id, :deleted_at], unique: true
  end
end
