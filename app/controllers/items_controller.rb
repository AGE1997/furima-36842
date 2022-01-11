class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_charges_id, :prefecture_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end