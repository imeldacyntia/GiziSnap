class Food < ApplicationRecord
  belongs_to :user

  validates :name, :quantity, :calories, :protein, :carbs, :fat,
          :energy, :saturatedfat, :polyunsaturatedfat, :monounsaturatedfat,
          :cholesterol, :fiber, :sugar, :sodium, :potassium,
          presence: true
end
