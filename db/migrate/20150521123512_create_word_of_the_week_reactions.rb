class CreateWordOfTheWeekReactions < ActiveRecord::Migration
  def change
    create_table :word_of_the_week_reactions do |t|
      t.string :title
      t.integer :user_id
      t.integer :word_of_the_week_id
      t.datetime :created_at
    end
  end
end
