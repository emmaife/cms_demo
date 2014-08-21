class AddOrderToMenuCategories < ActiveRecord::Migration
  def change
    add_column :menu_categories, :order, :integer
  end
end
