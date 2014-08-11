class DeleteMenuItems < ActiveRecord::Migration
  def change
    drop_table :menu_items
  end
end
