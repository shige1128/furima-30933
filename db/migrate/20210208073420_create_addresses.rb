class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code
      t.integer :area_id
      t.string :municipalities
      t.string :address_number
      t.string :building
      t.string :phone_number
      t.integer :order_id

      t.timestamps
    end
  end
end