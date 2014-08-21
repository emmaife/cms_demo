class AddEssenceMenu2IdToEssenceMenuItems < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_menu_items, :essence_menu2_id, :integer
  end
end
