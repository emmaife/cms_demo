class AddColumnToEssenceMenu2s < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_menu2s, :restaurant_id, :integer
  end
end
