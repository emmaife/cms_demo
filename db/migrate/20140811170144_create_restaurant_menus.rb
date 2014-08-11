class CreateRestaurantMenus < ActiveRecord::Migration
  def change
    create_table :restaurant_menus do |t|
      t.references :restaurant
      t.references :menu

      t.timestamps
    end
  end
end
