class CreateAlchemyEssenceMenus < ActiveRecord::Migration
  def change
    create_table :alchemy_essence_menus do |t|
      t.references :menu

      t.timestamps
    end
  end
end
