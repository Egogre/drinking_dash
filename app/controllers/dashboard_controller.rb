class DashboardController < ApplicationController

  def index
    redirect_to root_path unless self.admin?
    dash_badge
    @orders = Order.all.select(&:user_id)
    @categories = Category.all
    @drinks = Drink.all
    @current_user = current_user
  end

  def edit
    redirect_to root_path unless self.admin?
    @drink = Drink.new
    @category = Category.new

  end

def compete_transaction
  
end

def cancel_transaction
  
end

end
