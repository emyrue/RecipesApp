require 'rails_helper'

RSpec.describe 'Inventories', type: :request do
  before(:example) do
    @user = User.new(name: 'Thomas', email: 'thomas@thomas.com', password: 'emilythinksimcool',
                     password_confirmation: 'emilythinksimcool')
    @user.skip_confirmation!
    @user.save!
    sign_in @user
  end

  describe 'GET /index' do
    it 'should be successful' do
      get inventories_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'should be successful' do
      @inventory = Inventory.create(name: 'myInventory', user_id: @user.id)
      get inventory_path(@inventory)
      expect(response).to have_http_status(:ok)
    end
  end
end
