class AddMenuIdToEssenceMenu2s < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_menu2s, :menu_id, :integer
  end
end
