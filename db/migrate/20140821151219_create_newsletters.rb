class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.text :email_text
      t.string :email_subject

      t.timestamps
    end
  end
end
