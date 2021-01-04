class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
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
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item =Item.find(params[:id])
  end  

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end  
  end  

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :user, :image, :price, :category_id, :item_state_id, :shipping_area_id,
                                 :shipping_charge_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
