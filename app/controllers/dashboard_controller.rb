class DashboardController < ApplicationController

def index
  redirect_to root_path unless self.admin?
 
  @orders = Order.all.select(&:user_id)
end

def compete_transaction
  
end

def cancel_transaction
  
end

end
