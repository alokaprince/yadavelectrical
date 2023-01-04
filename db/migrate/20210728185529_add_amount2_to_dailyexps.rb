class AddAmount2ToDailyexps < ActiveRecord::Migration[6.0]
  def change
    add_column :dailyexps, :amount2, :float
  end
end
