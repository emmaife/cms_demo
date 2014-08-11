class AddGroupIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :business_group_id, :integer
  end
end
