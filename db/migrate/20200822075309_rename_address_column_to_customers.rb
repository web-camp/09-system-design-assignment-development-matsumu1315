class RenameAddressColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :address, :self_address
  end
end
