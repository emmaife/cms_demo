class AddBusinessTypeAndIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :business_type, :string
    add_column :locations, :business_id, :integer
  end
end
