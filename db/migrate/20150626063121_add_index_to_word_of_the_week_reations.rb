class AddIndexToWordOfTheWeekReations < ActiveRecord::Migration
  def change
  	add_index :word_of_the_week_reactions, :user_id
		add_index :word_of_the_week_reactions, :word_of_the_week_id
  end
end
