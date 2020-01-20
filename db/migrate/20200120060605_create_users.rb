class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email_id, null: false, unique: true
      t.string :password_digest
      t.string :remember
      t.boolean :is_admin

      t.timestamps
    end
  end
end
