class AddBodyToTag < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :body, :text
  end
end
