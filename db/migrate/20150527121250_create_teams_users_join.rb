class CreateTeamsUsersJoin < ActiveRecord::Migration
  def self.up
    create_table :teams_users_joins, id: false do |t|
    	t.column 'team_id', :integer
    	t.column 'user_id', :integer
    end
  end

  def self.down
  	drop_table 'teams_users'
  end
end
