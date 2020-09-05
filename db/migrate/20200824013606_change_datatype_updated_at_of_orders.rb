class ChangeDatatypeUpdatedAtOfOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :updated_at, :timestamp
  end
end
