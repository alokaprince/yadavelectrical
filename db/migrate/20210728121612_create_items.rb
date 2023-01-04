class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :itemname
      t.float :quantity
      t.float :rate
      t.string :unit
      t.float :amount
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
