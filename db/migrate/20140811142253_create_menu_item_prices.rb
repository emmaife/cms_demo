class CreateMenuItemPrices < ActiveRecord::Migration
  def change
    create_table :menu_item_prices do |t|
       t.float :price
      t.references :menu_item
      
      t.timestamps
    end
  end
end
