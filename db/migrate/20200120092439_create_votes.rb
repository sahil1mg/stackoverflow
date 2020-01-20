class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :has_liked
      t.belongs_to :user, foreign_key: true
      t.references :voted_object, polymorphic: true

      t.timestamps
    end
  end
end
