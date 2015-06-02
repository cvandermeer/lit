class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :team_id
      t.boolean :accepted	
    end
  end
end
