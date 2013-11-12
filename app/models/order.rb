class Order < ActiveRecord::Base
  validates :table_id, inclusion: { in: 0..9 }
  validates :status, inclusion: { in: [ "ordered", "paid", "cancelled", "completed"] }
  has_many :order_items
  belongs_to :user
  belongs_to :payment

  def grand_total
    total = 0
    order_items.each do |item|
      total += item.subtotal
    end
    return total
  end

end
