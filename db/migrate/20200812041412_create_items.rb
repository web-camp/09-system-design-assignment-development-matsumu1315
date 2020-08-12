class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      #下記を追加
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :explanation
      t.integer :price
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
