class AddBlockToDealer < ActiveRecord::Migration[6.0]
  def change
    add_column :dealers, :block, :string
  end
end
