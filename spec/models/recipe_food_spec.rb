require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:example) do
    @user = User.new(name: 'Thomas', email: 'thomas@thomas.com', password: 'emilythinksimcool',
                     password_confirmation: 'emilythinksimcool')
    @user.save!
    @recipe = Recipe.create(name: 'Orange Chicken', preparation_time: '30 min', cooking_time: '30 min',
                            description: 'Orange chicken',
                            public: false, user_id: @user.id)
    @food = Food.create(name: 'Chicken', measurement_unit: 'oz', price: 0.5)
    @recipefood = RecipeFood.create(quantity: 3, recipe_id: @recipe.id, food_id: @food.id)
  end

  it 'Quantity must be integer' do
    @recipefood.quantity = 1.5
    expect(@recipefood).to_not be_valid
  end

  it 'Quantity must be greater than 0' do
    @recipefood.quantity = -1
    expect(@recipefood).to_not be_valid
  end
end
