class AddressItemsController < ApplicationController
  before_action :index_create, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]
  def index
    @order = Order.new
    redirect_to root_path unless @item.address_item.blank?
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order = Order.new(address_item_params)
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
    params.require(:order).permit(:postal, :prefecture_id, :municipality, :address, :building, :phone,).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: address_item_params[:token],
      currency: 'jpy'
    )
  end

  def index_create
    @item = Item.find(params[:item_id])
  end  
end
