require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  before(:example) do
    @user = User.new(name: 'Thomas', email: 'thomas@thomas.com', password: 'emilythinksimcool',
                     password_confirmation: 'emilythinksimcool')
    @user.save!
    @inventory = Inventory.create(name: 'myInventory', user_id: @user.id)
    @food = Food.create(name: 'Chicken', measurement_unit: 'oz', price: 0.5)
    @inventoryfood = InventoryFood.create(quantity: 3, inventory_id: @inventory.id, food_id: @food.id)
  end

  it 'Quantity must be integer' do
    @inventoryfood.quantity = 1.5
    expect(@inventoryfood).to_not be_valid
  end

  it 'Quantity must be greater than 0' do
    @inventoryfood.quantity = -1
    expect(@inventoryfood).to_not be_valid
  end
end
