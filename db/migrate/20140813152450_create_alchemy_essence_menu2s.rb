class CreateAlchemyEssenceMenu2s < ActiveRecord::Migration
  def change
    create_table :alchemy_essence_menu2s do |t|
      t.string :name
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
