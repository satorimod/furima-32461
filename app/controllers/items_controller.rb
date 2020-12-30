class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :user, :image, :price, :category_id, :item_state_id, :shipping_area_id, :shipping_charge_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
