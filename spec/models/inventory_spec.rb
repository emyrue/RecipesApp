require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before(:example) do
    @user = User.new(name: 'Thomas', email: 'thomas@thomas.com', password: 'emilythinksimcool',
                     password_confirmation: 'emilythinksimcool')
    @user.save!
    @inventory = Inventory.create(name: 'myInventory', user_id: @user.id)
  end

  it 'Name has to be present' do
    @inventory.name = nil
    expect(@inventory).to_not be_valid
  end
end
