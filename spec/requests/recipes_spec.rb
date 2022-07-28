require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before(:example) do
    @user = User.new(name: 'Thomas', email: 'thomas@thomas.com', password: 'emilythinksimcool',
                     password_confirmation: 'emilythinksimcool')
    @user.skip_confirmation!
    @user.save!
    sign_in @user
  end

  describe "GET 'index'" do
    it 'should be successful' do
      get recipes_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET 'show'" do
    it 'should be successful' do
      @recipe = Recipe.create(name: 'Orange Chicken', preparation_time: '30 min', cooking_time: '30 min',
                              description: 'Orange chicken',
                              public: false, user_id: @user.id)
      get recipe_path(@recipe)
      expect(response).to have_http_status(:ok)
    end
  end
end
