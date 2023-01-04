class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :name
      t.string :HP
      t.string :company
      t.string :model
      t.string :pitch1
      t.float :turn1
      t.float :gauge
      t.float :weight
      t.integer :slot
      t.string :connection
      t.string :coil
      t.string :pitch2
      t.float :turn2
      t.float :stetarlen
      t.float :length
      t.text :remark
      t.float :amount

      t.timestamps
    end
  end
end
