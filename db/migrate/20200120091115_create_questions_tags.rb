class CreateQuestionsTags < ActiveRecord::Migration[5.1]
  def change
    create_table :questions_tags do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :question, foreign_key: true
    end
  end
end
