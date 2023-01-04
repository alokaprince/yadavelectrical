class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :father
      t.string :address
      t.string :mobile
      t.float :total
      t.float :recieve
      t.float :balance

      t.timestamps
    end
  end
end
