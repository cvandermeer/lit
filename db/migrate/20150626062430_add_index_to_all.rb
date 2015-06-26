class AddIndexToAll < ActiveRecord::Migration
  def change
  	add_index :memberships, [:user_id, :team_id]
  	add_index :questions, [:category_id, :language_id, :user_id]
  	add_index :teams, :user_id
  	add_index :user_results, [:category_id, :language_id, :user_id]
  end
end
