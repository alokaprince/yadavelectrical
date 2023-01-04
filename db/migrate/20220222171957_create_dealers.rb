class CreateDealers < ActiveRecord::Migration[6.0]
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :address
      t.string :mobile
      t.float :total
      t.float :recieve
      t.float :balance

      t.timestamps
    end
  end
end
