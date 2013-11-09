class OrderItem < ActiveRecord::Base
  belongs_to :drink
  belongs_to :order

def subtotal
  self.quantity * drink.price
end


end