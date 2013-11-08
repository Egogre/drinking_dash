class OrdersController < ApplicationController

def destroy
  session[:order_id] = nil
  redirect_to root_path
end

end
