class OrdersController < ApplicationController
  before_action :user_authorization, only: [:update, :show]

  def destroy
    session[:order_id] = nil
    redirect_to categories_path, notice: "Shopping Cart Emptied"
  end

  def show
      @payment = Payment.new
      @order = current_order
      @order.status = "ordered"
      @order.user_id = current_user.id
      @order.save
  end

  def update
    if params[:commit] == "Add a New Credit Card"
      @payment = Payment.new
      attributes = params[:payment]
      attributes[:user_id] = current_user.id
      @payment.create_new_payment(attributes)

      if current_order.present?
	redirect_to order_path(current_order)
      else
	redirect_to user_path(current_user)
      end

    else
      current_order.status_update_paid(params[:payment_id], params[:table_id])
      session[:order_id] = nil
      redirect_to user_path(current_user), notice: "Order Confirmed!"
      spender_badge
    end
  end

end

