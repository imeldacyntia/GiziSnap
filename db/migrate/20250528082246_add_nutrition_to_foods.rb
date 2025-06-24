class AddNutritionToFoods < ActiveRecord::Migration[8.0]
  def change
    add_column :foods, :calories, :integer
    add_column :foods, :protein, :integer
    add_column :foods, :carbs, :integer
    add_column :foods, :fat, :integer
  end
end
