class AddQuantityToFoods < ActiveRecord::Migration[8.0]
  def change
    add_column :foods, :quantity, :integer
  end
end
