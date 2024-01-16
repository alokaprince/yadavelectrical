class AddDateToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :date, :string
  end
end
