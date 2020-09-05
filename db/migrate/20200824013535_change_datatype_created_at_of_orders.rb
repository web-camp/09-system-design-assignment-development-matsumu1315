class ChangeDatatypeCreatedAtOfOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :created_at, :timestamp
  end
end
