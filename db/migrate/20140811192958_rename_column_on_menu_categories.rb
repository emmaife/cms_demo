class RenameColumnOnMenuCategories < ActiveRecord::Migration
  def change
    rename_column :menu_categories, :category, :name
  end
end
