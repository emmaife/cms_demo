class AddNameToRestaurantMenus < ActiveRecord::Migration
  def change
    add_column :restaurant_menus, :name, :string
  end
end
