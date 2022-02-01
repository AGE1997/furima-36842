class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:zip_code, :prefecture_id, :municipal_district, :address, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end