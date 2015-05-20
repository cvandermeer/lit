class CreateUserResults < ActiveRecord::Migration
  def change
    create_table :user_results do |t|
      t.integer :category_id
      t.integer :language_id
      t.boolean :correctly_answered
      t.integer :user_id
    end
  end
end
