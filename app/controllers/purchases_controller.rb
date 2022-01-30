class PurchasesController < ApplicationController
  def index
    @purchase_shipping = PurchadeShipping.new
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
  end
end