class OrdersController < ApplicationController

def destroy
  session[:order_id] = nil
  redirect_to categories_path, notice: "Shopping Cart Emptied"
end

end
