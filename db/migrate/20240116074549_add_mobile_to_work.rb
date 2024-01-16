class AddMobileToWork < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :mobile, :string
  end
end
