class OrderItemsController < ApplicationController
  before_action :load_order, only: [:create]
  def new
  end

  def create
    @order_item = OrderItem.find_or_initialize_by(drink_id: params[:drink_id], order_id: @order.id)
      @order_item.quantity += 1
    if @order_item.save
      redirect_to categories_path, notice: "#{@order_item.drink.name} added to cart"
    else
      redirect_to categories_path, notice: "Failed to add drink."
    end
  end

  def update
    @order_item = OrderItem.find( params[:id])
    @order_item.update_quantity(params[:order_item][:quantity])

    if @order_item.save || @order_item
     redirect_to :back
    else
     redirect_to :back, notice: "Quantity must be a whole positive integer."
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
