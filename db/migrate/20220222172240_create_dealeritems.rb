class CreateDealeritems < ActiveRecord::Migration[6.0]
  def change
    create_table :dealeritems do |t|
      t.string :itemname
      t.float :quantity
      t.float :rate
      t.string :unit
      t.float :amount
      t.references :dealerbill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
