class CreateNewsletterRecipients < ActiveRecord::Migration
  def change
    create_table :newsletter_recipients do |t|
      t.string :email, :null => false
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :zip

      t.timestamps
    end
  end
end
