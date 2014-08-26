class AddPostToSocialMediaToEssenceMenus < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_menus, :post_to_fb, :boolean
    add_column :alchemy_essence_menus, :fb_post_text, :text
    add_column :alchemy_essence_menus, :post_to_twitter, :boolean
    add_column :alchemy_essence_menus, :tweet, :text

  end
end
