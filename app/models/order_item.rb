class OrderItem < ActiveRecord::Base
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :drink
  belongs_to :order

  def subtotal
    self.quantity * drink.price
  end

  def update_quantity(amount)
    amount = amount.to_i
    self.quantity = amount
    self.destroy if amount.zero?
  end
end
