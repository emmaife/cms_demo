class RemoveBusinessTypeFromBusinessGroup < ActiveRecord::Migration
  def change
    remove_column :business_groups, :business_type
  end
end
