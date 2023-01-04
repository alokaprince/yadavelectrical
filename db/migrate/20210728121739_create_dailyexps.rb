class CreateDailyexps < ActiveRecord::Migration[6.0]
  def change
    create_table :dailyexps do |t|
      t.string :name
      t.text :remark
      t.float :amount

      t.timestamps
    end
  end
end
