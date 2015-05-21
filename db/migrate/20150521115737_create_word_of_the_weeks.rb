class CreateWordOfTheWeeks < ActiveRecord::Migration
  def change
    create_table :word_of_the_weeks do |t|
      t.string :title
    end
  end
end
