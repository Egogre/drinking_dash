require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  def test_card_number_can_only_be_numbers
    assert_raise(ActiveRecord::RecordInvalid) do
      Payment.create!(card_type: "Visa", credit_card_number: "Q234123412341234",
		      expiration_date: "0117")
    end
  end

  def test_card_type_cant_be_anything
    assert_raise(ActiveRecord::RecordInvalid) do
      Payment.create!(card_type: "ASDASDas", credit_card_number: "1234123412341234",
		      expiration_date: "0117")
    end
  end

  def test_expiration_date_has_to_be_real
    assert_raise(ActiveRecord::RecordInvalid) do
      Payment.create!(card_type: "Visa", credit_card_number: "1234123412341234",
		      expiration_date: "2117")
    end
  end

  def test_create_new_payment
    attributes = {card_type: "Visa", credit_card_number: "1" * 16,
		  "expiration_date(2i)"=> "10", "expiration_date(1i)" => "2015",
		  id: 1}
    payment = Payment.new
    payment.create_new_payment(attributes)
    assert_equal "1"* 16, payment.credit_card_number
    assert_equal "Visa", payment.card_type
  end
end
