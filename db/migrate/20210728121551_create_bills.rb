class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :billno
      t.date :date
      t.float :credit
      t.float :debit
      t.text :remark
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
