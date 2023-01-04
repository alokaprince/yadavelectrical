class AddAmount2ToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :amount2, :float
  end
end
