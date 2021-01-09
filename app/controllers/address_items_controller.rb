class AddressItemsController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end  
  end
  
  def create
    binding.pry
    @order = Order.new(address_item_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end  
  end

  private
  
  def address_item_params
    params.require(:order).permit( :postal, :prefecture_id, :municipality, :address, :building, :phone, :token).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end 
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: address_item_params[:token],
      currency: 'jpy'
    )
  end  
end
