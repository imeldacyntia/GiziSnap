class FoodsController < ApplicationController
  allow_unauthenticated_access only: [ :create ]
  skip_forgery_protection

  def create
    @food = Food.new(add_food_params)
    @food.user = @current_user

    if @food.save
      respond_to do |format|
        format.json { render json: { Success: true, Message: "Food created successfully", food: @food }, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: { Success: false, message: @food.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def add_food_params
    params.permit(:name, :quantity, :calories, :protein, :carbs, :fat, :energy, :saturatedfat, :polyunsaturatedfat, :monounsaturatedfat, :cholesterol, :fiber, :sugar, :sodium, :potassium)
  end
end
