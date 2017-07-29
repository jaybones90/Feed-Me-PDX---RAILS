class OrderItemsController < ApplicationController

  def new
    @order = current_order
    @order_item = OrderItem.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @order = current_order
    @item = current_order.order_items.new(order_item_params)
    @item.save
    session[:order_id] = @order.id
    redirect_to new_order_item_path
  end

  private
  def order_item_params
    params.require(:order_item).permit(:item_name, :quantity, :price)
  end


end
