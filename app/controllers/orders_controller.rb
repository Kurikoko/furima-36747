class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(param[:id])
  end

  def create
    # @oreder = Oreder.create(order_params)
    # if @order.save
      # redirect_to root_path
    # else
      # render :index
    # end
  end

  private
  # def order_params
    # params.permit(:order).permit().merge(user_id: current_user.id, item_id: @item.id)
  # end

end
