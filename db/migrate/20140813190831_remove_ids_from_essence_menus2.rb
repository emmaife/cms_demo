class RemoveIdsFromEssenceMenus2 < ActiveRecord::Migration
  def change
    remove_column :alchemy_essence_menu2s, :restaurant_id
    remove_column :alchemy_essence_menu2s, :menu_id
  end
end
