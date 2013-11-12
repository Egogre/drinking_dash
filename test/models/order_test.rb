require "test_helper"
require "pry"

class OrderTest < ActiveSupport::TestCase

  def test_shopping_cart_returns_grand_total
    order = Order.all.last
    assert_equal 9.99, order.grand_total.to_f
  end

  def test_order_only_accepts_numbers
    assert_raise(ActiveRecord::RecordInvalid) do
      Order.create!(user_id: 1, credit_card_number: "123412341234123d")
    end
  end

  def test_order_cant_have_a_table_id_of_more_than_9
    assert_raise(ActiveRecord::RecordInvalid) do
      Order.create!(user_id: 1, credit_card_number: "1234123412341238", table_id: 10)
    end
  end

  def test_order_cant_have_a_table_id_of_less_than_0
    assert_raise(ActiveRecord::RecordInvalid) do
      Order.create!(user_id: 1, credit_card_number: "1234123412341238", table_id: -1)
    end
  end

  def test_order_status_cant_be_anything
    assert_raise(ActiveRecord::RecordInvalid) do
      Order.create!(user_id: 1, credit_card_number: "1234123412341238", table_id: 1,
		    status: "FREE")
    end
  end

end
