require "test_helper"
require "pry"

class OrderTest < ActiveSupport::TestCase

  def test_shopping_cart_returns_grand_total
    order = Order.all.last
    assert_equal 9.99, order.grand_total.to_f
  end

end
