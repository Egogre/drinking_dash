class OrdersController < ApplicationController

  def destroy
    session[:order_id] = nil
    redirect_to categories_path, notice: "Shopping Cart Emptied"
  end

  def show
    @order = current_order
  end

  def update
    current_order.payment_type = params[:payment_id]
    current_order.credit_card_number = params[:credit_card_number]
    current_order.table_id = params[:table_id]
    current_order.save
    redirect_to user_path(current_user), notice: "Order Confirmed!"
  end

end
