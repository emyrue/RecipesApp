require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:example) do
    @food = Food.create(name: 'Chicken', measurement_unit: 'oz', price: 0.5)
  end

  it 'Name has to be present' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'Name has correct length' do
    @food.name = 'a' * 100
    expect(@food).to_not be_valid
  end

  it 'Measurement Unit has to be present' do
    @food.measurement_unit = nil
    expect(@food).to_not be_valid
  end

  it 'Measurement Unit has to be present' do
    @food.price = nil
    expect(@food).to_not be_valid
  end
end
