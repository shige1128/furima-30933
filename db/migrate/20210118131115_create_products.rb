class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :products_name
      t.text :text
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_id
      t.integer :area_id
      t.integer :days_id
      t.integer :price_id
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
