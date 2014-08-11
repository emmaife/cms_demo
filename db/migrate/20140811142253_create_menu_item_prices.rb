class CreateMenuItemPrices < ActiveRecord::Migration
  def change
    create_table :menu_item_prices do |t|

      t.timestamps
    end
  end
end
