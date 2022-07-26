class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.includes([:user]).where(user_id: current_user.id)
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
   @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(user_id: current_user.id, name: inventory_params['name'])

   if @inventory.save
    flash[:notice] = 'Inventory saved successfully'
   else
    flash[:alert] = 'Inventory not saved'
   end

   redirect_to inventories_path
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
