class CreateAlchemyEssenceMenuItems < ActiveRecord::Migration
  def change
    create_table :alchemy_essence_menu_items do |t|
      t.integer :menu_item_id
      t.integer :menu_category_id
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
