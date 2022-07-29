class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
    @foods = Food.all
  end

  def create
    @inventory_food = InventoryFood.new(inventory_id: params[:inventory_id], food_id: inventory_food_params[:food_id],
                                        quantity: inventory_food_params[:quantity])
    if @inventory_food.save
      flash[:notice] = 'Food saved successfully'
    else
      flash[:alert] = 'Food not saved'
    end
    redirect_to inventory_path(params[:inventory_id])
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(params[:inventory_id])
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :quantity)
  end
end
