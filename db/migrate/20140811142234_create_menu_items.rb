class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.references :menu
      
      t.timestamps
    end
  end
end
