class CreateDefaultOnOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :postage, :integer, :default => 800
  end
end
