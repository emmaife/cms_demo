class ChangeColumnonEssenceMenu2 < ActiveRecord::Migration
  def change
    rename_column :alchemy_essence_menu2s, :restaurant_id, :menu_id
  end
end
