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
    @needed_foods = []

    @recipe.recipe_foods.includes([:food]).each do |recipe_food|
      inventory_food = @inventory.inventory_foods.find_by(food_id: recipe_food.food.id)
      if defined?(inventory_food.quantity)
        quantity = recipe_food.quantity - inventory_food.quantity
        price = quantity * recipe_food.food.price
        hash = { name: recipe_food.food.name, quantity: quantity, price: price } if quantity.positive?
      else
        quantity = recipe_food.quantity
        price = quantity * recipe_food.food.price
        hash = {
          name: recipe_food.food.name,
          quantity: quantity,
          price: price
        }
      end
      @needed_foods << hash
    end
  end
end
