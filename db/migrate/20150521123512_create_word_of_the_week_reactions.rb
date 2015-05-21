class CreateWordOfTheWeekReactions < ActiveRecord::Migration
  def change
    create_table :word_of_the_week_reactions do |t|
      t.string :title
      t.string :user_id
      t.string :word_of_the_week_id
      t.datetime :created_at
    end
  end
end
