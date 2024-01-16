class AddBlockToCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :block, :string
  end
end
