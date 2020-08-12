class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

      #下記を追加
      t.integer :customer_id
      t.integer :item_id
      t.integer :amount

      t.timestamps
    end
  end
end
