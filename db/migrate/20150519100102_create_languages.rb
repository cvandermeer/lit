class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :title
    end
  end
end
