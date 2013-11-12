class DashboardController < ApplicationController

def index
  redirect_to root_path unless self.admin?
 
  @orders = Order.all.select(&:user_id)
end

end
