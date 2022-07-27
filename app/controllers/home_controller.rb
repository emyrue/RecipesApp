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

  end
end
