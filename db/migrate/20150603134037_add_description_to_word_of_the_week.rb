class AddDescriptionToWordOfTheWeek < ActiveRecord::Migration
  def change
    add_column :word_of_the_weeks, :description, :text
  end
end
