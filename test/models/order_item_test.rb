require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  
  def test_subtotal_returns_unit_times_price
    beer = OrderItem.find(1)
    assert_equal 10.00, beer.subtotal.to_f
  end
end
