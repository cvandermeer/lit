class AddFacebookImageUrlToUser < ActiveRecord::Migration
  def change
    add_column :users, :facebook_image_url, :string
  end
end
