class AddOrderToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :order, :integer
  end
end
