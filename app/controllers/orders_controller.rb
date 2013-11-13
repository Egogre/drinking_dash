class OrdersController < ApplicationController

  def destroy
    session[:order_id] = nil
    redirect_to categories_path, notice: "Shopping Cart Emptied"
  end

  def show
    redirect_to categories_path, notice: "you must login to place an order"  unless current_user
    @order = current_order
    @order.status = "ordered"
    @order.save
  end

  def update
    current_order.status_update_paid(params[:payment_id], params[:table_id])
    redirect_to user_path(current_user), notice: "Order Confirmed!"
  end

end
