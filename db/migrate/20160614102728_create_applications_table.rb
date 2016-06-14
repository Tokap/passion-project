class CreateApplicationsTable < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :user_id
      
      t.string :company
      t.string :position_title
      t.string :reference_number
      t.string :contact_name
      t.string :phone
      t.string :email
      
      t.date :date_applied
      t.boolean :followed_up

      t.timestamps
    end
  end
end
