class OrdersController < ApplicationController

  def destroy
    session[:order_id] = nil
    redirect_to categories_path, notice: "Shopping Cart Emptied"
  end

  def show
    redirect_to categories_path, notice: "you must login to place an order"  unless current_user
    @order = current_order
    @order.status = "ordered"
    @order.user_id = current_user.id
    @order.save
  end

  def update
    current_order.payment_id = params[:payment_id]
    current_order.table_id = params[:table_id]
    current_order.status = "paid"
    current_order.save
    redirect_to user_path(current_user), notice: "Order Confirmed!"
  end

end
