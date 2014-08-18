class AddAddressToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :phone, :string
    add_column :restaurants, :hours, :text


  end
end
