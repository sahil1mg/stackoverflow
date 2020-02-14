class AddDeletedAtToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :deleted_at, :timestamp
  end
end
