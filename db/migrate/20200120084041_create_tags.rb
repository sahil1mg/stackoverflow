class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :label, unique:true, null: false

      t.timestamps
    end
  end
end
