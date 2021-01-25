class RenameDaysIdColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :days_id, :day_id
  end
end
