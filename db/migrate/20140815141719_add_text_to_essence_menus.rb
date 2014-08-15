class AddTextToEssenceMenus < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_menus, :menu_text, :text
    add_column :alchemy_essence_menus, :restaurant_id, :integer
  end
end
