class FoodController < ApplicationController
  def index
    @food = Food.all
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
