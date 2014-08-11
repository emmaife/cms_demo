class RenameColumnOnRestaurantMenuItems < ActiveRecord::Migration
  def change
    rename_column :restaurant_menu_items, :item_name, :name
  end
end
