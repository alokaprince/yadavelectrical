class AddGauge2ToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :guage2, :float
  end
end
