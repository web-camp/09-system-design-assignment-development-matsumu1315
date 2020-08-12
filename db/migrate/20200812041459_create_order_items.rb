class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      #下記を追加
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.integer :productal_status

      t.timestamps
    end
  end
end
