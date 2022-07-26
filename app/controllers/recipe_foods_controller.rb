class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], food_id: recipe_food_params[:food_id],
    quantity: recipe_food_params[:quantity])
    if @recipe_food.save
        flash[:notice] = 'Food saved successfully'
    else
        flash[:alert] = 'Food not saved'
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
