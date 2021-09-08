class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :information, :price, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :image)
    .merge(user_id: current_user.id)
  end
end
