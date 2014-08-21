class UpdatePriceInMenuItems < ActiveRecord::Migration
  def change
    change_column :menu_items, :price, :float, precision: 2
  end
end
