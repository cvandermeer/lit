class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :category_id
      t.integer :language_id
      t.integer :correct_answer_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
