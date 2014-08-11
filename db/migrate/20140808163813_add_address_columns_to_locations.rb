class AddAddressColumnsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :address, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
  end
end
