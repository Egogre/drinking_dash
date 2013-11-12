class Order < ActiveRecord::Base
  validates :credit_card_number, format: { with: /\A\d{16}\z/, message: "Numbers only" }
  validates :table_id, inclusion: { in: 0..9 }
  validates :status, inclusion: { in: [ "ordered", "paid", "cancelled", "completed"] }
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
