class CreateRestaurantMenuItems < ActiveRecord::Migration
  def change
    create_table :restaurant_menu_items do |t|
      t.references :restaurant_menu_category
      t.string :item_name

      t.timestamps
    end
  end
end
