class HomeController < ApplicationController
  def index
    @foods = Food.all
    @recipes = Recipe.all
    @inventories = Inventory.all
  end

  def public_recipes
    @recipes = Recipe.includes([:user]).where(public: true)
  end

  def shopping_list
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
  end
end
