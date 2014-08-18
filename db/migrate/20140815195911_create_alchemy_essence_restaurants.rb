class CreateAlchemyEssenceRestaurants < ActiveRecord::Migration
  def change
    create_table :alchemy_essence_restaurants do |t|
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
