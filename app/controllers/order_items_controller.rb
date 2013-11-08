class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]
  def new
  end

  def create
    @order_item = OrderItem.new(drink_id: params[:drink_id], order_id: @order.id)
    if @order_item.save
      redirect_to root_path, notice: "#{@order_item.drink.name} added to cart"
    else
      redirect_to root_path, notice: "Failed to add drink."
    end
  end

  private

  def load_order
    @order = Order.find_or_initialize_by(id: session[:order_id])
    if @order.new_record?
      @order.save
    session[:order_id] = @order.id
    end
  end
end
