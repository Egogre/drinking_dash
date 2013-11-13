class DashboardController < ApplicationController

def index
  redirect_to root_path unless self.admin?
 
  @orders = Order.all.select(&:user_id)
  @categories = Category.all
  @drinks = Drink.all
end

end
