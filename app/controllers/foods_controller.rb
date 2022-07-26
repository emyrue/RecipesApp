class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    error = 'Error'
      alert(error)
    if @food.save
      format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
    else
      error = 'Error'
      alert(error)
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
