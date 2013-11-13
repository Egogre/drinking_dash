class Order < ActiveRecord::Base
  validates :table_id, inclusion: { in: 0..9 }, if: :table_id
  validates :status, inclusion: { in: [ "ordered", "paid", "cancelled", "completed"] }, if: :status
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

  def status_update_paid(payment, table)
    self.payment_id = payment
    self.table_id = table
    self.status = "paid"
    self.save
  end

  def status_update_completed

  end

  def ordered?
    status == "ordered"
  end

end
