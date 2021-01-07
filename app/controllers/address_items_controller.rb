class AddressItemsController < ApplicationController
  def index
    @address_item = AddressItem.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @address_item = AddressItem.new(address_item_params)
    if @address_item.valid?
      @address_item.save
      redirect_to root_path
    else
      render action: :index
    end  
  end

  private
  
  def address_item_params
    params.require(:address_item).permit(:user, :item, :postal, :prefecrure_id, :municipality, :address, :building, :phone, :address_item)
  end  
end
