class DashboardController < ApplicationController

def index
  redirect_to root_path unless self.admin?
  current_user.unique_badge_add(3)
  @orders = Order.all.select(&:user_id)
  @categories = Category.all
  @drinks = Drink.all
  @current_user = current_user
end

def compete_transaction
  
end

def cancel_transaction
  
end

end
