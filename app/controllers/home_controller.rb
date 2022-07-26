class HomeController < ApplicationController
  def index
    @foods = Food.all
    @recipes = Recipe.all
    @inventories = Inventory.all
  end

end