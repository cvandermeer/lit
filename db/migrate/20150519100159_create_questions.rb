class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :answer
      t.integer :category_id
      t.integer :language_id
      t.string :user_id
      t.timestamps null: false
    end
  end
end
