class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_params, only: [:show, :update, :edit, :destroy]
  before_action :redirect_different_user, only: [:edit, :destroy]
  before_action :redirect_sold_out_item, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :information, :price, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :scheduled_delivery_id, :image)
          .merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def redirect_different_user
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def redirect_sold_out_item
    redirect_to root_path if @item.order.present?
  end
end
