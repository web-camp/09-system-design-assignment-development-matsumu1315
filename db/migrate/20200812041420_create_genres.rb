class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|

     #下記を追記
      t.string :name
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
