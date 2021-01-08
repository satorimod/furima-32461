class AddressItemsController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order = Order.new(address_item_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end  
  end

  private
  
  def address_item_params
    params.require(:order).permit(:user, :item, :postal, :prefecture_id, :municipality, :address, :building, :phone, :address_item, :item_id, :user_id)
  end  
end
