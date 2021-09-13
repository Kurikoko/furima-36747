class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_params, only: [:index, :create]
  before_action :redirect_seller_user, only: [:index]
  before_action :redirect_sold_out_item, only: [:index]

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefecture_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def redirect_seller_user
    redirect_to root_path if current_user.id == @item.user_id
  end

  def redirect_sold_out_item
    redirect_to root_path if @item.order.present?
  end
end
