class AddNameToEssenceMenu < ActiveRecord::Migration
  def change
    add_column :alchemy_essence_menus, :name, :string
  end
end
