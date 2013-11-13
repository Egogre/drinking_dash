class OrdersController < ApplicationController

  def destroy
    session[:order_id] = nil
    redirect_to categories_path, notice: "Shopping Cart Emptied"
  end

  def show
    unless current_user
      redirect_to categories_path, notice: "you must login to place an order"
    else
      @payment = Payment.new
      @order = current_order
      @order.status = "ordered"
      @order.user_id = current_user.id
      @order.save
    end
  end

  def update
    if params[:commit] == "Add a New Credit Card"
      create_new_payment
    else
      current_order.payment_id = params[:payment_id]
      current_order.table_id = params[:table_id]
      current_order.status = "paid"
      current_order.save
      session[:order_id] = nil
      redirect_to user_path(current_user), notice: "Order Confirmed!"
    end
  end

  def create_new_payment
    @payment = Payment.new
    @payment.user_id = current_user.id
    attributes = params[:payment]
    @payment.card_type = attributes[:card_type]
    @payment.credit_card_number = attributes[:credit_card_number]
    @payment.expiration_date = Payment.format_expiration_date(attributes["expiration_date(2i)"],
							      attributes["expiration_date(1i)"])
    @payment.user_id = current_user.id
    @payment.save!
    if current_order.present?
      redirect_to order_path(current_order)
    else
      redirect_to user_path(current_user)
    end
  end

end

