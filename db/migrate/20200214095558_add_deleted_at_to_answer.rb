class AddDeletedAtToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :deleted_at, :timestamp
  end
end
