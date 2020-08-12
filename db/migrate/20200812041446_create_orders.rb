class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      #下記を追加
      t.integer :customer_id
      t.integer :postage
      t.integer :amount_billed
      t.integer :how_to_pay
      t.integer :status
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
