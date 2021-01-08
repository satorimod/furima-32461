class AddressItemsController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order = Order.new(address_item_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      Payjp.api_key = "sk_test_e3ac582fb6e71729c0e4e243"
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: address_item_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      render action: :index
    end  
  end

  private
  
  def address_item_params
    params.require(:order).permit(:user, :item, :postal, :prefecture_id, :municipality, :address, :building, :phone, :address_item, :item_id, :user_id).merge(token: params[:token])
  end  
end
