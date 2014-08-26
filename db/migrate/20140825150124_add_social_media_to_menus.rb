class AddSocialMediaToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :post_to_fb, :boolean
    add_column :menus, :fb_post_text, :text
    add_column :menus, :post_to_twitter, :boolean
    add_column :menus, :tweet, :text
  end
end
