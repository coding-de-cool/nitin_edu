class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :user_id
      t.integer :pincode
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
