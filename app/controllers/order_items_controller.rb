class OrderItemsController < ApplicationController
  
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    flash[:success] = "Item added to the Cart"
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    flash[:success] = 'No. of Items updated Successfully'
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    flash[:success] = "Item removed from Your Cart"
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
