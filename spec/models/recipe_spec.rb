require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:example) do
    @user = User.new(name: 'Thomas', email: 'thomas@thomas.com', password: 'emilythinksimcool',
                     password_confirmation: 'emilythinksimcool')
    @user.save!
    @recipe = Recipe.create(name: 'Orange Chicken', preparation_time: '30 min', cooking_time: '30 min',
                            description: 'Orange chicken',
                            public: false, user_id: @user.id)
  end

  it 'Name has to be present' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'Name has correct length' do
    @recipe.name = 'a' * 100
    expect(@recipe).to_not be_valid
  end

  it 'Preparation time must be present' do
    @recipe.preparation_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'Cooking time must be present' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid
  end

  it 'Description has to be present' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end

  it 'Description has correct length' do
    @recipe.name = 'a' * 1000
    expect(@recipe).to_not be_valid
  end

  it 'Public must be present' do
    @recipe.public = nil
    expect(@recipe).to_not be_valid
  end

  it 'Public must be boolean value' do
    @recipe.public = nil
    expect(@recipe).to_not be_valid
  end
end
