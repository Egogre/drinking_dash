class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def grand_total
    total = 0
    order_items.each do |item|
      total += item.subtotal
    end
    return total
  end

end
