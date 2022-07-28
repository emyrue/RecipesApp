class RecipeFoodsController < ApplicationController
  load_and_authorize_resource
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
    authorize! :create, @recipe_food
  end

  def create
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], food_id: recipe_food_params[:food_id],
                                  quantity: recipe_food_params[:quantity])
    authorize! :create, @recipe_food
    if @recipe_food.save
      flash[:notice] = 'Food saved successfully'
    else
      flash[:alert] = 'Food not saved'
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    authorize! :destroy, @recipe_food
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
