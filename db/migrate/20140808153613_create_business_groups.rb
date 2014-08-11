class CreateBusinessGroups < ActiveRecord::Migration
  def change
    create_table :business_groups do |t|
      t.string :name
      t.string :business_type
      t.references :organization
      t.timestamps
    end
  end
end
