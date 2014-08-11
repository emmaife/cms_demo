class AddNameToRestaurantMenuCategories < ActiveRecord::Migration
  def change
    add_column :restaurant_menu_categories, :name, :string
  end
end
