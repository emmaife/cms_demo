class CreateRestaurantMenuCategories < ActiveRecord::Migration
  def change
    create_table :restaurant_menu_categories do |t|
      t.references :restaurant_menu
      t.references :menu_category

      t.timestamps
    end
  end
end
