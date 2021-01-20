class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :products_name , null: false
      t.text :text            , null: false
      t.integer :category_id  , null: false
      t.integer :status_id    , null: false
      t.integer :shipping_id  , null: false
      t.integer :area_id      , null: false
      t.integer :days_id      , null: false
      t.integer :price_id     , null: false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
