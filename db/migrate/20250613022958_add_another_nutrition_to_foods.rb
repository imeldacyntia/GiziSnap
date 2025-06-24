class AddAnotherNutritionToFoods < ActiveRecord::Migration[8.0]
  def change
    add_column :foods, :energy, :integer
    add_column :foods, :saturatedfat, :integer
    add_column :foods, :polyunsaturatedfat, :integer
    add_column :foods, :monounsaturatedfat, :integer
    add_column :foods, :cholesterol, :integer
    add_column :foods, :fiber, :integer
    add_column :foods, :sugar, :integer
    add_column :foods, :sodium, :integer
    add_column :foods, :potassium, :integer
  end
end
