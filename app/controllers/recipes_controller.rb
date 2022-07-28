class RecipesController < ApplicationController

  def index
    @recipes = Recipe.includes([:user]).where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.includes([:user]).find(params[:id])
    @recipe_foods = RecipeFood.includes([:food]).where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
    authorize! :create, @recipe
  end

  def create
    @recipe = Recipe.new(user_id: current_user.id, name: recipe_params['name'],
                         preparation_time: recipe_params['preparation_time'],
                         cooking_time: recipe_params['cooking_time'], description: recipe_params['description'],
                         public: recipe_params['public'])
    authorize! :create, @recipe

    if @recipe.save
      flash[:notice] = 'Recipe saved successfully'
    else
      flash[:alert] = 'Recipe not saved'
    end

    redirect_to recipes_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def new_shopping_list
    @recipe = Recipe.find(params[:recipe_id])
    @inventories = Inventory.where(user_id: current_user.id)
    authorize! :create, @recipe
  end

  def create_new_shopping_list
    url = "#{shopping_list_path}?recipe_id=#{params.permit(:recipe_id)[:recipe_id]}"
    url += "&inventory_id=#{params.permit(:inventory_id)[:inventory_id]}"
    redirect_to url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
