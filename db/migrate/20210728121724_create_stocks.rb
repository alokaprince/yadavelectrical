class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :prodname
      t.string :prodno
      t.string :manufact
      t.string :category
      t.string :unit
      t.float :quantity
      t.float :price1
      t.float :price2
      t.float :price3

      t.timestamps
    end
  end
end
