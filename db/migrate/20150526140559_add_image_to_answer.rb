class AddImageToAnswer < ActiveRecord::Migration
  def change
  	add_column :answers, :image, :string
  end
end
